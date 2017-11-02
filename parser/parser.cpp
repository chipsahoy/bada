#include <sstream>
#include "parser.h"
#include <iostream>

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

		// rule() records the rule used in output. It also detects the line
		// number changing.
		//
		void rule(int r) 
		{
			if (_token.Line() != _lastLine) {
				_lastLine = _token.Line();
				_output << std::endl << _lastLine << ": " << r;
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
		int _nextLocation;
	public:
		BadaParser(std::function<Token()> gettoken) :
			Parser(gettoken, std::bind(&BadaParser::program, this)),
			_nextLocation(0)
		{
		}
	private:

		int location(TokenType type)
		{
			int size = 0;
			switch (type)
			{
			case TokenType::tok_real:
				size = 8;
				break;

			case TokenType::tok_boolean:
				size = 4;
				break;

			case TokenType::tok_integer:
				size = 4;
				break;
			}
			int rc = _nextLocation;
			_nextLocation -= size;
			return rc;
		}

		// program() is the start rule.
		void program() 
		{
			rule(1);
			match(TokenType::tok_procedure);
			match(TokenType::identifier);
			match(TokenType::tok_is);
			decls();
			match(TokenType::tok_begin);
			stats();
			match(TokenType::tok_end);
			match(TokenType::identifier);
			match(TokenType::semicolon);
		}

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

		void decl() 
		{
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

		void rest(std::string name) 
		{
			if (TokenType::tok_constant == token().Type()) {
				rule(8);
				match(TokenType::tok_constant);
				basic_type(name, true);
				match(TokenType::op_assignment);
				literal_type();
				match(TokenType::semicolon);
			}
			else {
				rule(7);
				basic_type(name, false);
				match(TokenType::semicolon);
			}
		}

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

			default:
				make_error(TokenType::identifier);
				break;
			}
		}

		void assignment_statement() 
		{
			rule(15);
			idnonterminal();
			match(TokenType::op_assignment);
			expression();
			match(TokenType::semicolon);
		}

		void if_statement() 
		{
			rule(16);
			match(TokenType::tok_if);
			expression();
			match(TokenType::tok_then);
			stats();
			match(TokenType::tok_end);
			match(TokenType::tok_if);
			match(TokenType::semicolon);
		}

		void read_statement() 
		{
			rule(17);
			match(TokenType::tok_get);
			match(TokenType::left_paren);
			idnonterminal();
			match(TokenType::right_paren);
			match(TokenType::semicolon);
		}

		void write_statement() 
		{
			rule(18);
			match(TokenType::tok_put);
			match(TokenType::left_paren);
			write_expression();
			match(TokenType::right_paren);
			match(TokenType::semicolon);

		}

		void while_statement() 
		{
			rule(19);
			match(TokenType::tok_while);
			expression();
			match(TokenType::tok_loop);
			stats();
			match(TokenType::tok_end);
			match(TokenType::tok_loop);
			match(TokenType::semicolon);
		}

		void block_statement() 
		{
			rule(20);
			int saved_location = _nextLocation;
			symbols.BeginScope();
			declpart();
			match(TokenType::tok_begin);
			stats();
			match(TokenType::tok_end);
			match(TokenType::semicolon);
			symbols.EndScope();
			_nextLocation = saved_location;

		}

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

		void write_expression() 
		{
			if (TokenType::literal_string == token().Type()) {
				rule(23);
				match(TokenType::literal_string);
			}
			else {
				rule(24);
				expression();
			}
		}

		void expression() 
		{
			rule(25);
			term();
			expprime();
		}

		void expprime() 
		{
			if (TokenType::op_add == token().Type()) {
				rule(26);
				match(TokenType::op_add);
				term();
				expprime();
			}
			else {
				rule(27);
			}
		}

		void term() 
		{
			rule(28);
			relfactor();
			termprime();
		}

		void termprime() 
		{
			if (TokenType::op_multiply == token().Type()) {
				rule(29);
				match(TokenType::op_multiply);
				relfactor();
				termprime();
			}
			else {
				rule(30);
			}
		}

		void relfactor() 
		{
			rule(31);
			factor();
			factorprime();
		}

		void factorprime() 
		{
			if (TokenType::op_relational == token().Type()) {
				rule(32);
				match(TokenType::op_relational);
				factor();
			}
			else {
				rule(33);
			}
		}

		void factor() 
		{
			switch (token().Type()) 
			{
			case TokenType::op_not:
				rule(34);
				match(token().Type());
				factor();
				break;

			case TokenType::left_paren:
				rule(35);
				match(token().Type());
				expression();
				match(TokenType::right_paren);
				break;
			
			case TokenType::identifier:
				rule(36);
				idnonterminal();
				break;
			
			case TokenType::literal_boolean:
			case TokenType::literal_integer:
			case TokenType::literal_real:
				rule(37);
				match(token().Type());
				break;
			
			default:
				make_error(TokenType::identifier);
				break;
			}
		}

		void idnonterminal()
		{
			rule(40);
			auto symbol = symbols.SearchForSymbol(token().Lexeme());
			if(nullptr == symbol)
				non_fatal("undefined variable ");
			match(TokenType::identifier);
		}

		void basic_type(std::string name, bool constant)
		{
			switch (token().Type()) {
			case TokenType::tok_boolean:
			case TokenType::tok_integer:
			case TokenType::tok_real:
				rule(38);
				symbols.AddSymbol(name, token().Type(), location(token().Type()),
					constant);
				match(token().Type());
				break;

			default:
				// error
				make_error(TokenType::tok_integer);
				break;
			}
		}

		void literal_type() 
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
	};
}

// The parse function exposes a minimal interface to BADA parsing.
// Input: a GetToken function.
// Output: returns a leftmost derivation list of rules, line by line.
// Error: errors are returned in error and immediately end the parsing.
//
std::string parse(std::function<Token()> gettoken, std::string & error)
{
	BadaParser parser(gettoken);
	std::string output = parser.parse(error);
	return output;
}
