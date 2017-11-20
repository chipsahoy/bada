#define _CRT_SECURE_NO_WARNINGS
#include <sstream>
#include <fstream>

#include <iostream>

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
			_nextParam(12),
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

		void write(std::string fn, std::string comment)
		{
			_code << '\t' << fn << "\t\t\t# " << comment << std::endl;
		}

		void write(std::string fn, std::string param1, std::string comment)
		{
			_code << '\t' << fn << '\t' << param1 << "\t\t\t# " << 
				comment << std::endl;
		}

		void write(std::string fn, std::string param1, std::string param2, 
			std::string comment)
		{
			_code << '\t' << fn << '\t' << param1 << ", " << param2 << 
				"\t\t\t# " << comment << std::endl;
		}

		void write(std::string fn, std::string param1, std::string param2,
			std::string param3, std::string comment)
		{
			_code << '\t' << fn << '\t' << param1 << ", " << param2 << ", " 
				<< param3 << "\t\t\t# " << comment << std::endl;
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
			std::ofstream file(_filename);
			if (!file) {
				std::cout << std::strerror(errno);
			}
			file << prolog << std::endl;
			file << _data.str() << std::endl;
			file << _code.str() << std::endl;
		}

		virtual int BeginScope()
		{
			int saved = _nextLocal;
			_nextLocal = 0;
			_nextParam = 12;
			return saved;
		}

		virtual void EndScope(int saved)
		{
			_nextLocal = saved;
		}

		virtual int BeginProcedure(ProcedureSymbol& symbol)
		{
			write("# begin procedure " + symbol.label());
			write(symbol.label() + ':');
			// setup stack frame
			std::string locals_size = "LOCALS_" + 
				std::to_string(symbol.location().offset());

			write("addiu", "$sp", "-8", "space for saved registers");
			write("sw", "$ra", "8($sp)", "save return so we can make calls");
			write("sw", "$fp", "4($sp)", "preserve caller frame");
			write("add", "$fp", "$sp", "$0", "create our frame");

			write("addiu", "$sp", locals_size, "space for local vars");

			return 0;
		}

		virtual void EndProcedure(ProcedureSymbol& symbol, int saved)
		{
			std::string locals_size = "LOCALS_" +
				std::to_string(symbol.location().offset());
			_data << locals_size << " = " << -_nextLocal << std::endl;
			int to_pop = _nextLocal + 8;

			write("lw", "$ra", "8($fp)", "restore our return addr");
			write("lw", "$fp", "4($fp)", "restore caller frame");
			write("addiu", "$sp", std::to_string(-to_pop), "restore locals space");

			write("jr", "$ra", "");
			write("# end procedure " + symbol.label());
			write("");
		}

		virtual void PutInteger(Location loc)
		{
			write("li", "$v0", "1", "write integer function");
			load_reg("$a0", loc, "load the integer");
			write("syscall", "do the write integer");
		}

		virtual void PutString(std::string msg)
		{
			std::string label = "literal_" + std::to_string(_nextProcedure++);
			_data << label << ":\t.asciiz\t\"" << msg << "\"\t# a string\n";
			write("li", "$v0", "4", "write string function");
			write("la", "$a0", label, "load string literal");
			write("syscall", "do the write string");
		}

		virtual void PutChar(char ch)
		{
			write("li", "$v0", "11", "write char function");
			write("li", "$a0", std::to_string(ch), "ascii char");
			write("syscall", "do the write char");
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

			write(instruction, "$t2", "$t0", "$t1", "binary op");
			
			if (invert)
			{
				write("sltu", "$t2", "$0", "$t2", "are they not equal?");
				write("xori", "$t2", "$t2", "1", "now shows if equal");
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
				write("xori", "$t1", "$t0", "1", "not operator");
				store_reg("$t1", dest.location, "store result");
				dest.type = TokenType::tok_boolean;
				break;

			case 'r': // read
				dest.type = er.type;

				if (TokenType::tok_integer == er.type)
				{
					write("li", "$v0", "5", "read integer function");
					write("syscall", "do the read");
					store_reg("$v0", dest.location, "store result");
				}
				else if (TokenType::tok_real == er.type)
				{
					write("li", "$v0", "7", "read double function");
					write("syscall", "do the read");
					store_reg("$f0", dest.location, "store result");
				}
				break;
			}

		}

		virtual Location BeginWhile()
		{
			Location loc = NextCodeLocation(TokenType::tok_while);
			std::string label = "while_" + std::to_string(loc.offset()) + ':';
			write(label, "before the while expression");
			return loc;
		}

		virtual void EndWhile(Location loc)
		{
			std::string label = "while_" + std::to_string(loc.offset());
			write("j", label, "jump to start of while");
		}
		virtual Location BeginIf(ExpRecord er)
		{
			Location loc = NextCodeLocation(TokenType::tok_if);
			load_reg("$t0", er.location, "load if expression");
			std::string label = "if_" + std::to_string(loc.offset());
			write("beq", "$t0", "$0", label, "jump past when false");
			return loc;
		}

		virtual void EndIf(Location loc)
		{
			std::string label = "if_" + std::to_string(loc.offset()) + ':';
			write(label, "after the if block");
		}

		void load_reg(std::string dest, Location loc, std::string comment)
		{
			write("lw", dest, std::to_string(loc.offset()) + "($fp)", 
				comment);
		}

		void store_reg(std::string src, Location loc, std::string comment)
		{
			write("sw", src, std::to_string(loc.offset()) + "($fp)", 
				comment);
		}

		virtual void CallProcedure(ProcedureSymbol& symbol)
		{

			write("jal", symbol.label(), "call user procedure");

			if (symbol.params().size() > 0) {
				
			}
		}

		virtual void PassParameter(ExpRecord er, bool out)
		{
			if (out)
			{
				// store address
				write("addiu", "$sp", "$sp", "-4", "make space");
				load_reg("$t0", er.location, "load param");
				write("sw", "$t0", "4($sp)", "push param");
			}
			else
			{
				int size = 4;
				if (TokenType::tok_real == er.type) 
					size = 8;
				write("addiu", "$sp", "$sp", std::to_string(-size), "make space");
				load_reg("$t0", er.location, "load param");
				write("sw", "$t0", std::to_string(size) + "($sp)", "push param");
			}
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
			write("li", "$t0", literal, "place a literal in register");
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