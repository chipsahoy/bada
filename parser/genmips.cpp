#include <sstream>
#include <fstream>

#include "codegen.h"

namespace {

	// These strings hold the skeleton of the generated assembly
	extern char* prolog;
	extern char* epilog1;
	extern char* epilog2;

	class MipsCode : public Code
	{
		// Write to code and data independently and then join together later.
		std::stringstream _code;
		std::stringstream _data;

		// State needed for Location
		int _nextLocal;
		int _nextParam;
		int _nextProcedure;

		// our output file
		std::string _filename;

	public:
		MipsCode(std::string filename) :
			_filename(filename),
			_nextLocal(0),
			_nextParam(0),
			_nextProcedure(0)
		{
			_code << ".text\n.globl main\n" << "# begin user procedures\n\n";
		}

		// write will write the code, with a version for each number of params.
		//
		void write(std::string msg)
		{
			_code << msg << std::endl;
		}

		void write(std::string fn, std::string comment, bool noIndent)
		{
			if (!noIndent)
				_code << '\t';
			_code << fn << "\t\t\t# " << comment << std::endl;
		}

		void write(std::string fn, std::string param1, std::string comment, 
			bool noIndent)
		{
			if (!noIndent)
				_code << '\t';
			_code << fn << '\t' << param1 << "\t\t\t# " << comment << std::endl;
		}

		void write(std::string fn, std::string param1, std::string param2, 
			std::string comment, bool noIndent)
		{
			if (!noIndent)
				_code << '\t';
			_code << fn << '\t' << param1 << ", " << param2 << "\t\t\t# "
				<< comment << std::endl;
		}

		void write(std::string fn, std::string param1, std::string param2,
			std::string param3, std::string comment, bool noIndent)
		{
			if (!noIndent)
				_code << '\t';

			_code << fn << '\t' << param1 << ", " << param2 << ", " << param3
				<< "\t\t\t# " << comment << std::endl;
		}

		virtual void GenerateCode(ProcedureSymbol& main)
		{
			// add skeleton code, call user main procedure.
			// epilog contains the real entry point
			// it prints a welcome and then calls the user main procedure.

			_code << epilog1 << std::endl;
			
			CallProcedure(main);
			
			_code << epilog2 << std::endl;

			// Write it all out.
			std::fstream file(_filename);
			file << prolog << std::endl;
			file << _data.str() << std::endl;
			file << _code.str() << std::endl;
		}

		virtual int BeginScope()
		{
			int saved = _nextLocal;
			_nextLocal = 0;
			_nextParam = 16;
			return saved;
		}

		virtual void EndScope(int saved)
		{
			_nextLocal = saved;
		}

		virtual int BeginProcedure(ProcedureSymbol& symbol)
		{
			write(symbol.label() + ':', "begin user procedure", true);
			return 0;
		}

		virtual void EndProcedure(ProcedureSymbol& symbol, int saved)
		{
			write("jr", "$ra", "end procedure " + symbol.label(), true);
			write("");
		}

		virtual void PutInteger(Location loc)
		{
			write("li", "$v0", "1", "write integer function", false);
			load_reg("$a0", loc, "load the integer");
			write("syscall", "do the write integer", false);
		}

		virtual void PutString(std::string msg)
		{
			std::string label = "literal" + std::to_string(_nextProcedure++);
			_data << label << ":\t.asciiz\t\"" << msg << "\"\t# a string\n";
			write("li", "$v0", "4", "write string function", false);
			write("la", "$a0", label, "load string literal", false);
			write("syscall", "do the write string", false);
		}

		virtual void BinaryOp(std::string op, ExpRecord dest, 
			ExpRecord lop, ExpRecord rop)
		{
			std::string instruction;
			bool invert = false;

			switch (op[0])
			{
			case '+':
				instruction = "addu";
				dest.type = lop.type;
				break;

			case '-':
				instruction = "sub";
				dest.type = lop.type;
				break;

			case '<':
				instruction = "slt";
				dest.type = TokenType::tok_boolean;
				break;
			
			case '>':
			{
				instruction = "slt";
				dest.type = TokenType::tok_boolean;
				// swap left, right so we can just test less than.
				ExpRecord er = lop;
				lop = rop;
				rop = er;
			}
				break;

			case '=':
				instruction = "sub";
				dest.type = TokenType::tok_boolean;
				invert = true;
				break;

			default:
				invert = false;
				break;

			}
			load_reg("$t0", lop.location, "load left op");
			load_reg("$t1", rop.location, "load right op");

			write(instruction, "$t2", "$t0", "$t1", "binary op", false);
			
			if (invert)
			{
				write("sltu", "$t2", "$0", "$t2", "are they not equal?", false);
				write("xori", "$t2", "$t2", "1", "now shows if equal", false);
			}
			
			store_reg("$t2", dest.location, "store result");
		}

		virtual void UnaryOp(std::string op, ExpRecord dest, ExpRecord er)
		{
			std::string instruction;


			switch (op[0])
			{
			case ':': // assignment
				load_reg("$t0", er.location, "load op");
				store_reg("$t0", dest.location, "assignment");
				dest.type = er.type;
				break;

			case 'n': // not
				load_reg("$t0", er.location, "load op");
				write("xori", "$t1", "$t0", "1", "not operator", false);
				store_reg("$t1", dest.location, "store result");
				dest.type = TokenType::tok_boolean;
				break;

			case 'r': // read
				dest.type = er.type;

				if (TokenType::tok_integer == er.type)
				{
					write("li", "$v0", "5", "read integer function", false);
					write("syscall", "do the read", false);
					store_reg("$v0", dest.location, "store result");
				}
				else if (TokenType::tok_real == er.type)
				{
					write("li", "$v0", "7", "read double function", false);
					write("syscall", "do the read", false);
					store_reg("$f0", dest.location, "store result");
				}
				break;
			}

		}

		virtual Location BeginWhile()
		{
			Location loc = NextCodeLocation(TokenType::tok_while);
			std::string label = "while_" + std::to_string(loc.offset()) + ':';
			write(label, "before the while expression", false);
			return loc;
		}

		virtual void EndWhile(Location loc)
		{
			std::string label = "while_" + std::to_string(loc.offset());
			write("j", label, "jump to start of while", false);
		}
		virtual Location BeginIf(ExpRecord er)
		{
			Location loc = NextCodeLocation(TokenType::tok_if);
			load_reg("$t0", er.location, "load if expression");
			std::string label = "if_" + std::to_string(loc.offset());
			write("beq", "$t0", "$0", label, "jump past when false", false);
			return loc;
		}

		virtual void EndIf(Location loc)
		{
			std::string label = "if_" + std::to_string(loc.offset()) + ':';
			write(label, "after the if block", false);
		}

		void load_reg(std::string dest, Location loc, std::string comment)
		{
			write("lw", dest, std::to_string(loc.offset()) + "($sp)", 
				comment, false);
		}

		void store_reg(std::string src, Location loc, std::string comment)
		{
			write("sw", src, std::to_string(loc.offset()) + "($sp)", 
				comment, false);
		}

		virtual void CallProcedure(ProcedureSymbol& symbol)
		{
			write("jal", symbol.label(), "call user procedure", false);
		}

		virtual ExpRecord Literal(TokenType type, const std::string& lex)
		{
			std::string literal = lex;

			ExpRecord er;
			switch (type)
			{
			case TokenType::literal_boolean:
				if (lex == "true")
					literal = "1";
				else
					literal = "0";

				er.type = TokenType::tok_boolean;
				break;

			case TokenType::literal_integer:
				er.type = TokenType::tok_integer;
				break;

			case TokenType::literal_real:
				er.type = TokenType::tok_real;
				break;
			}
			er.location = LocalVariable(er.type);
			write("li", "$t0", literal, "place a literal in register", false);
			store_reg("$t0", er.location, "move literal to memory");
			return er;
		}

		virtual Location LocalVariable(TokenType type)
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
			int loc = _nextLocal;
			_nextLocal -= size;
			return Location(0, loc, type);

		}
		virtual Location Parameter(TokenType type)
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
			int loc = _nextParam;
			_nextParam += size;
			return Location(0, loc, type);

		}

		virtual Location NextCodeLocation(TokenType type)
		{
			return Location(0, _nextProcedure++, type);
		}
	};

	char* prolog = "# MIPS assembly generated from BADA source.\n"
		".data\n"
		"enter_msg : .asciiz	\"\\nbegin program\\n\"\n"
		"exit_msg : .asciiz \"\\nend program\\n\"\n"
		"\n# user string literals:\n";
	
	char* epilog1 = 
		"\n# end user procedures.\n\n"
		"main:\n		# program entry point\n"
		"	li $v0, 4\n"
		"	la $a0, enter_msg\n"
		"	syscall		#print string\n"
		"\n";

	char* epilog2 = 
		"\n	li $v0, 4\n"
		"	la $a0, exit_msg\n"
		"	syscall		# print string\n"
		"\n"
		"	li $v0, 10\n"
		"	syscall		# exit program\n"
		"\n";

}

extern Code* MakeX86Gen(std::string name);

Code* MakeCodeGen(std::string name, OutputFormat type)
{
	if (OutputFormat::MIPS == type) {
		return new MipsCode(name);
	}
	if (OutputFormat::X86 == type) {
		return MakeX86Gen(name);
	}

	return nullptr;
}