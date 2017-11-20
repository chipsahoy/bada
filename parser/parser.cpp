#include <sstream>
#include <iostream>

#include "parser.h"
#include "codegen.h"

// add source line numbers for better errors.
#define match(x) _match(__LINE__, (x))
#define make_error(x) _make_error(__LINE__, (x))
#define non_fatal(x) _non_fatal(__LINE__, (x))

namespace {

	// The Parser class has all the mechanics of parsing but nothing language
	// specific. The only dependencies are it needs a TokenType::eof and a 
	// TokenType::error.
	// It encapsulates all the state of parsing.
	class Parser {
	private:
		// State: 
		//

		int _errorCount;

		// _token is the current token. Keeping it here in the base class
		// guarantees that it only changes on a successful match() because
		// _token is private.
		Token _token;

		// _lastRule is the last rule applied.
		int _lastRule;

		// _lastLine is the line number of the current token.
		int _lastLine;

		// _GetToken is a function pointer that returns tokens.
		std::function<Token()> GetToken;

		// FirstRule is a function pointer to the start rule
		// in a derived class.
		std::function<void()> FirstRule;

		// _output collects the rules of the derivation.
		std::stringstream _output;

	protected:

		SymbolTable symbols;

		// the derived class uses token() to get read access to the current.
		//
		Token token()
		{
			return _token;
		}

		// the user uses the match() macro which expands to _match()
		// with the source line number added.
		//
		// _match() either consumes the current token on a match
		// or halts with an error on a mismatch.
		//
		void _match(int line, TokenType expected) 
		{
			if (expected == _token.Type()) 
				_token = GetToken();
			else
				_make_error(line, expected);
		}

		virtual void OnNewLine(int line)
		{

		}
		// rule() records the rule used in output. It also detects the line
		// number changing.
		//
		void rule(int r) 
		{
			if (_token.Line() != _lastLine) {
				_lastLine = _token.Line();
				_output << std::endl << _lastLine << ": " << r;
				OnNewLine(_lastLine);
			}
			else {
				_output << ',' << r;
			}
			_lastRule = r;
		}

		// the user uses the make_error() macro which expands to _make_error()
		// with the source line number added.
		//
		// _make_error() makes a useful error message from the saved state.
		// it throws an exception to unwind the recursive descent gracefully.
		//
		// It's not clear who the user of the error messages is. Having the
		// source line numbers is very useful for ME to make sense of errors.
		// Getting similar utility from another scheme would be a lot of work.
		//
		void _make_error(int line, TokenType expected) 
		{
			std::stringstream ss;
			ss << "error source line " << token().Line() <<
				" parser line " << line << ' ';
			if (TokenType::error == token().Type()) {
				ss << token().Lexeme();
			}
			else {
				ss << "expected " << DescribeTokenType(expected) <<
					" have " << token().Lexeme();
			}
			throw ss.str();
		}

		void _non_fatal(int line, std::string message)
		{
			std::stringstream ss;
			ss << "\nerror source line " << token().Line() <<
				" parser line " << line << ' ' << message << 
				"'" << token().Lexeme() << "'\n";
			_errorCount++;
			_output << ss.str();
		}
	public:
		
		// The Parser constructor initializes all state.
		//
		Parser(std::function<Token()> gettoken,
			std::function<void()> firstrule) :

			GetToken(gettoken),
			_token(TokenType::error, "", 0),
			FirstRule(firstrule),
			_lastLine(0),
			_errorCount(0),
			_lastRule(0)
		{
		}

		// parse() gets the first token and calls the start rule.
		// It returns a leftmost derivation and an error string.
		//
		std::string parse(std::string& error) 
		{
			try 
			{
				error = "";
				_token = GetToken();
				symbols.BeginScope();
				FirstRule();
				symbols.EndScope();
				match(TokenType::eof);
				_output << std::endl << symbols.ToString();
			}
			catch (std::string errCaught) 
			{
				error = errCaught;
			}
			return _output.str();
		}
	};

	// BadaParser derives from Parser and contains exactly the grammar rules 
	// of the BADA language.
	class BadaParser : public Parser 
	{
		Code& code;
	public:
		BadaParser(std::function<Token()> gettoken, Code& c) :
			code(c),
			Parser(gettoken, std::bind(&BadaParser::program, this))
			
		{
		}
	private:


		// program() is the start rule.
		// program 1: procstart procend
		void program() 
		{
			rule(1);
			// setup a globl scope to hold the main().
			symbols.BeginScope();
			auto main = proc_defn();
			code.GenerateCode(*main);
			symbols.EndScope();
		}

		// param 51: direction IDTOK ':' basic_type
		void param(ProcedureSymbol& proc)
		{
			rule(51);
			param_info p;
			p.out = direction();
			std::string name = token().Lexeme();
			p.name = name;
			match(TokenType::identifier);
			match(TokenType::colon);
			p.type = token().Type();
			param_type(name, p.out);

			// The param_info is an integral part of the Procedure symbol.
			// it's needed to check the number, types, direction of parameters.
			// so it gets added to the procedure symbol here.
			//
			proc.AddParam(p);

			// Also, the parameter is a local variable once in the procedure
			// body, so add it to the symbol table independently.
			//
			symbols.AddLocal(p.name, p.type, code.Parameter(p.type), false);
		}

		// proc_defn 41: PROCTOK IDTOK paramlist
		// ISTOK decls BEGINTOK stats ENDTOK IDTOK ';'
		std::shared_ptr<ProcedureSymbol> proc_defn()
		{
			rule(41);


			match(TokenType::tok_procedure);
			std::string name = token().Lexeme();
			match(TokenType::identifier);
			auto sym = symbols.GetLocalSymbol(name);
			if (nullptr != sym) {
				non_fatal("duplicate procedure definition.");
			}


			// the procedure name belongs in the parent scope.
			// The parameters belong in the new block.
			auto proc = symbols.AddProcedure(name, 
				code.NextCodeLocation());
			symbols.BeginScope();
			int saved = code.BeginScope();
			paramlist(*proc);
			match(TokenType::tok_is);
			decls();
			match(TokenType::tok_begin);
			code.BeginProcedure(*proc);
			stats();
			match(TokenType::tok_end);
			if (name != token().Lexeme()) {
				non_fatal("Procedure end wrong name.");
			}
			match(TokenType::identifier);
			match(TokenType::semicolon);

			code.EndProcedure(*proc, saved);
			symbols.EndScope();
			code.EndScope(saved);
			return proc;
		}

		// blockst      20   :  declpart   BEGINTOK   stats   ENDTOK  ';'
		void block_statement()
		{
			rule(20);
			// start each block at 0 offset.
			symbols.BeginScope();
			int saved_location = code.BeginScope();
			declpart();
			match(TokenType::tok_begin);
			stats();
			match(TokenType::tok_end);
			match(TokenType::semicolon);
			code.EndScope(saved_location);
			symbols.EndScope();

		}

		// writeexp     23,24:  STRLITTOK  |  express
		void write_expression()
		{
			if (TokenType::literal_string == token().Type()) {
				rule(23);
				code.PutString(token().Lexeme());
				match(TokenType::literal_string);
			}
			else {
				rule(24);
				ExpRecord er;
				expression(er);
				if (er.type == TokenType::tok_integer)
					code.PutInteger(er.location);
			}
		}

		// basic_type   38   : BOOLTOK | INTTOK | REALTOK	
		void basic_type(std::string name, bool constant)
		{
			switch (token().Type()) {
			case TokenType::tok_boolean:
			case TokenType::tok_integer:
			case TokenType::tok_real:
				rule(38);
				symbols.AddLocal(name, token().Type(),
					code.LocalVariable(token().Type()), constant);
				match(token().Type());
				break;

			default:
				// error
				make_error(TokenType::tok_integer);
				break;
			}
		}

		// direction 54,55: 'in' | 'out'
		bool direction()
		{
			bool out = false;
			if (token().Type() == TokenType::tok_out)
			{
				rule(55);
				match(TokenType::tok_out);
				out = true;
			}
			else
			{
				rule(54);
				match(TokenType::tok_in);
			}
			return out;
		}



		// moreparams 52, 53: ';' param moreparams | epsilon
		void moreparams(ProcedureSymbol& proc)
		{
			if (token().Type() == TokenType::semicolon) {
				rule(52);
				match(TokenType::semicolon);
				param(proc);
				moreparams(proc);
			}
			else {
				rule(53);
			}
		}
		// paramlist 49,50: '(' param moreparams ')' | epsilon
		void paramlist(ProcedureSymbol& proc)
		{

			if (token().Type() == TokenType::left_paren) {
				rule(49);
				match(TokenType::left_paren);
				param(proc);
				moreparams(proc);
				match(TokenType::right_paren);
			}
			else {
				rule(50);
			}
		}

		// stats  2,3  :   statmt   stats    |    <empty>
		void stats() 
		{
			if (TokenType::tok_end == token().Type()) {
				rule(3);
				return;
			}
			rule(2);
			statement();
			stats();
		}

		//decls	  4,5  :   decl  decls       |    <empty>
		void decls() 
		{
			if (TokenType::tok_begin == token().Type()) {
				rule(5);
				return;
			}
			rule(4);
			decl();
			decls();
		}

		// decl         6,46 :   IDTOK ':' rest | procdecldefn
		void decl() 
		{
			if (token().Type() == TokenType::tok_procedure) {
				rule(46);
				proc_defn();
			}
			else {
				rule(6);
				std::string name = token().Lexeme();
				auto symbol = symbols.GetLocalSymbol(token().Lexeme());
				if (nullptr != symbol)
				{
					non_fatal("duplicate definition ");
				}
				match(TokenType::identifier);
				match(TokenType::colon);
				rest(name);
			}
		}

		// rest   7,8  :   BASTYPTOK  ';' | CONSTTOK BASTYPTOK ASTOK LITTOK ';'
		void rest(std::string name) 
		{
			if (TokenType::tok_constant == token().Type()) {
				rule(8);
				match(TokenType::tok_constant);
				basic_type(name, true);
				match(TokenType::op_assignment);
				ExpRecord er;
				literal_type(er);
				match(TokenType::semicolon);
			}
			else {
				rule(7);
				basic_type(name, false);
				match(TokenType::semicolon);
			}
		}

		// statmt 9-14  :  assignstat  |  ifstat   |  readstat   |  writestat
		// | blockst | loopst | procinvoke
		void statement() 
		{
			switch (token().Type()) {
			case TokenType::identifier:
				rule(9);
				assignment_statement();
				break;

			case TokenType::tok_if:
				rule(10);
				if_statement();
				break;

			case TokenType::tok_get:
				rule(11);
				read_statement();
				break;

			case TokenType::tok_put:
				rule(12);
				write_statement();
				break;

			case TokenType::tok_declare:
			case TokenType::tok_begin:
				rule(13);
				block_statement();
				break;

			case TokenType::tok_while:
				rule(14);
				while_statement();
				break;

			case TokenType::tok_call:
				rule(47);
				proc_invoke();
				break;

			default:
				make_error(TokenType::identifier);
				break;
			}
		}

		// assignstat   15   :  idnonterm  ASTOK express ';'
		void assignment_statement() 
		{
			rule(15);
			ExpRecord lhs;
			idnonterminal(lhs);
			match(TokenType::op_assignment);
			ExpRecord rhs;
			expression(rhs);
			code.UnaryOp(":=", lhs, rhs);
			match(TokenType::semicolon);
		}

		// ifstat       16   :  IFTOK express THENTOK  stats ENDTOK IFTOK  ';'
		void if_statement() 
		{
			rule(16);
			match(TokenType::tok_if);
			ExpRecord er;
			expression(er);
			match(TokenType::tok_then);
			int after = code.BeginIf(er);
			stats();
			match(TokenType::tok_end);
			match(TokenType::tok_if);
			match(TokenType::semicolon);
			code.EndIf(after);
		}

		// readstat     17   :  READTOK '(' idnonterm ')' ';'
		void read_statement() 
		{
			rule(17);
			match(TokenType::tok_get);
			match(TokenType::left_paren);
			ExpRecord er;
			idnonterminal(er);
			code.UnaryOp("read", er, er);
			match(TokenType::right_paren);
			match(TokenType::semicolon);
		}

		// writestat    18   :  WRITETOK '('  writeexp ')' ';'
		void write_statement() 
		{
			rule(18);
			bool putline = false;
			if (token().Lexeme() == "put_line")
				putline = true;
			match(TokenType::tok_put);
			match(TokenType::left_paren);
			write_expression();
			if (putline)
				code.PutChar('\n');
			match(TokenType::right_paren);
			match(TokenType::semicolon);

		}

		// loopst  19   :  WHILETOK express LOOPTOK stats  ENDTOK LOOPTOK ';'
		void while_statement() 
		{
			rule(19);
			match(TokenType::tok_while);
			int before = code.BeginWhile();
			ExpRecord er;
			expression(er);
			int after = code.BeginIf(er);
			match(TokenType::tok_loop);
			stats();
			match(TokenType::tok_end);
			match(TokenType::tok_loop);
			match(TokenType::semicolon);
			code.EndWhile(before);
			code.EndIf(after);
		}


		// procinvoke 48: CALLTOK PROCID invoke_params ';'
		void proc_invoke()
		{
			rule(48);
			match(TokenType::tok_call);
			std::string name = token().Lexeme();
			std::shared_ptr<ProcedureSymbol> proc = nullptr;
			int depth;
			auto sym = symbols.SearchForSymbol(name, depth);
			if (sym->type() != TokenType::tok_procedure) {
				non_fatal("expected a procedure");
			}
			else {
				proc = std::static_pointer_cast<ProcedureSymbol>(sym);
			}
			
			match(TokenType::identifier);
			int current_param = 0;
			invoke_params(proc, current_param);
			if (proc->params().size() != current_param)
			{
				non_fatal("wrong number of parameters for procedure");
			}
			code.CallProcedure(*proc, depth);
			match(TokenType::semicolon);
		}

		// invoke_params 56,57: '(' invokeparam moreinvoke ')' | epsilon
		void invoke_params(std::shared_ptr<ProcedureSymbol> proc, int& ix)
		{
			std::vector<std::string> params;
			if (token().Type() == TokenType::left_paren) {
				rule(56);
				match(TokenType::left_paren);
				invoke_param(proc, ix);
				more_invoke(proc, ix);
				match(TokenType::right_paren);
			}
			else {
				rule(57);
			}
			// do the invoke.
		}

		// invokeparam 58,59: expression | out IDTOK
		void invoke_param(std::shared_ptr<ProcedureSymbol> proc, int& ix)
		{
			if (token().Type() == TokenType::tok_out) {
				rule(59);
				match(TokenType::tok_out);
				ExpRecord er;
				idnonterminal(er);
				code.PassParameter(er, true);
				ix++;
			}
			else {
				rule(58);
				ExpRecord er;
				expression(er);
				code.PassParameter(er, false);
				ix++;
			}
		}

		// moreinvoke 60,61: ',' invokeparam moreinvoke | epsilon
		void more_invoke(std::shared_ptr<ProcedureSymbol> proc, int& ix)
		{
			if (token().Type() == TokenType::tok_comma) {
				rule(60);
				match(TokenType::tok_comma);
				invoke_param(proc, ix);
				more_invoke(proc, ix);
			}
			else {
				rule(61);
			}
		}

		// declpart     21,22:  DECTOK  decl  decls		 |    <empty>
		void declpart() 
		{
			if (TokenType::tok_declare == token().Type()) {
				rule(21);
				match(TokenType::tok_declare);
				decl();
				decls();
			}
			else {
				rule(22);
			}
		}


		// express      25   :  term expprime       
		void expression(ExpRecord& er) 
		{
			rule(25);
			term(er);
			expprime(er);
		}

		// expprime     26,27:  ADDOPTOK  term expprime   |  <empty>  
		void expprime(ExpRecord& er) 
		{
			if (TokenType::op_add == token().Type()) {
				rule(26);
				
				ExpRecord lhs = er;
				std::string op = token().Lexeme();

				match(TokenType::op_add);
				term(er);
				if (lhs.type != er.type)
					non_fatal("type mismatch");
				ExpRecord result = code.Literal(lhs.type, "0");
				code.BinaryOp(op, result, lhs, er);
				er = result;
				expprime(er);
			}
			else {
				rule(27);
			}
		}

		// term         28   :  relfactor termprime
		void term(ExpRecord& er) 
		{
			rule(28);
			relfactor(er);
			termprime(er);
		}

		// termprime    29,30:  MULOPTOK  relfactor termprime  |  <empty> 
		void termprime(ExpRecord& er)
		{
			if (TokenType::op_multiply == token().Type()) {
				rule(29);
				match(TokenType::op_multiply);
				relfactor(er);
				termprime(er);
			}
			else {
				rule(30);
			}
		}

		// relfactor    31   :  factor factorprime
		void relfactor(ExpRecord& er)
		{
			rule(31);
			factor(er);
			factorprime(er);
		}

		// factorprime  32,33:  RELOPTOK  factor          |  <empty>
		void factorprime(ExpRecord& er)
		{
			if (TokenType::op_relational == token().Type()) {
				rule(32);
				std::string op = token().Lexeme();
				ExpRecord lop = er;
				match(TokenType::op_relational);
				factor(er);
				code.BinaryOp(op, er, lop, er);
			}
			else {
				rule(33);
			}
		}

		// factor       34-37:  NOTTOK   factor             
		// | idnonterm
		//	| LITTOK
		//	| '('  express  ')'
		void factor(ExpRecord& er)
		{
			switch (token().Type()) 
			{
			case TokenType::op_not:
				rule(34);
				match(token().Type());
				factor(er);
				code.UnaryOp("not", er, er);
				break;

			case TokenType::left_paren:
				rule(35);
				match(token().Type());
				expression(er);
				match(TokenType::right_paren);
				break;
			
			case TokenType::identifier:
				rule(36);
				idnonterminal(er);
				break;
			
			case TokenType::literal_boolean:
			case TokenType::literal_integer:
			case TokenType::literal_real:
				rule(37);
				er = code.Literal(token().Type(), token().Lexeme());

				match(token().Type());
				break;

			
			default:
				make_error(TokenType::identifier);
				break;
			}
		}

		// idnonterm     40  :  IDTOK
		void idnonterminal(ExpRecord& er)
		{
			rule(40);
			int depth;
			auto symbol = symbols.SearchForSymbol(token().Lexeme(), depth);
			if(nullptr == symbol)
				non_fatal("undefined variable ");
			else {
				er.type = symbol->type();
				er.location = Location(depth, symbol->offset(), er.type);
			}
			match(TokenType::identifier);
		}
		// param_type 62 :  BOOLTOK | INTTOK | REALTOK
		void param_type(std::string name, bool out)
		{
			switch (token().Type()) {
			case TokenType::tok_boolean:
			case TokenType::tok_integer:
			case TokenType::tok_real:
				rule(38);
				match(token().Type());
				break;

			default:
				// error
				make_error(TokenType::tok_integer);
				break;
			}
		}


		// literal_type 39   : LITERALBOOL | LITERALINT | LITERALREAL
		void literal_type(ExpRecord& er)
		{
			switch (token().Type()) {
			case TokenType::literal_boolean:
			case TokenType::literal_integer:
			case TokenType::literal_real:
				rule(39);
				match(token().Type());
				break;
			default:
				// error
				make_error(TokenType::literal_integer);
				break;
			}
		}

		void OnNewLine(int line)
		{
			code.OnNewLine(line);
		}
	};
}

// The parse function exposes a minimal interface to BADA parsing.
// Input: a GetToken function.
// Output: returns a leftmost derivation list of rules, line by line.
// Error: errors are returned in error and immediately end the parsing.
//
std::string parse(std::function<Token()> gettoken, Code& c, std::string & error)
{
	BadaParser parser(gettoken, c);
	std::string output = parser.parse(error);
	return output;
}

/*
In ada a procedures nest and a procedure can access the data and methods of an ancestor procedure. I implement this with a stack of parent frame pointers.

Locations are offsets in the current scope. Location (+8) always contains the address of the parent scope frame. It is passed as the final parameter in any function call.

Example: calling a nested function:
push fp -- the value of pfp will be the current scope
call nested (pushes return)

Example: calling a peer function
push [fp+12] -- the pfp won't change so copy the value
call peer (pushes return)

Example: calling a function at grandparent level:
push [[fp+12]+12] -- the value of **fp will be the parent scope
call ancestor (pushes return).

To find the number of levels to dereference, FindSymbol must return the distance with the symbol.


param 3
param 2
param 1
pfp
return address
saved fp
fp

Entry code:
push bp
mov bp, sp

exit code:
mov sp, bp+4
pop bp
return (pop params)

now have locations:
params		bp+16...
parent fp	bp+12
return 		bp+8
old bp 		bp+4
fp		bp
locals		bp-0...

*/
