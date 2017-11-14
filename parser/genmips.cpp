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

		virtual void PutString(std::string msg)
		{
			std::string label = "literal" + std::to_string(_nextProcedure++);
			_data << label << ":\t.asciiz\t\"" << msg << "\"\t# a string\n";
			write("li", "$v0", "4", "write string function", false);
			write("la", "$a0", label, "load string literal", false);
			write("syscall", "do the write string", false);
		}


		virtual void CallProcedure(ProcedureSymbol& symbol)
		{
			write("jal", symbol.label(), "call user procedure", false);
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
		virtual Location Procedure(std::string name)
		{
			return Location(0, _nextProcedure++, TokenType::tok_procedure);
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