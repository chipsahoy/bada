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
			_nextLocal(),
			_nextParam(16),
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
			
			CallProcedure(main, 0);
			
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
			_nextParam = 16;
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
				std::to_string(symbol.offset());

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
				std::to_string(symbol.offset());
			_data << locals_size << " = " << _nextLocal << std::endl;
			_data << "PARAM_SIZE_" << std::to_string(symbol.offset()) <<
				" = " << _nextParam << std::endl;

			int to_pop = _nextLocal - 8;

			write("lw", "$ra", "8($fp)", "restore our return addr");
			write("lw", "$fp", "4($fp)", "restore caller frame");
			write("addiu", "$sp", std::to_string(-to_pop), "restore locals space");

			write("jr", "$ra", "");
			write("# end procedure " + symbol.label());
			write("");
		}

		virtual void PutNumber(Location loc)
		{
			if (TokenType::tok_integer == loc.type)
			{
				write("li", "$v0", "1", "write integer function");
				load_reg("$a0", loc, "load the integer");
				write("syscall", "do the write integer");
			}
			else if (TokenType::tok_real == loc.type)
			{
				write("li", "$v0", "2", "write float function");
				load_reg("$f12", loc, "load the float");
				write("syscall", "do the write float");
			}
			else if (TokenType::tok_boolean == loc.type)
			{
				load_reg("$t0", loc, "load the bool");
				int label = NextCodeLocation();
				write("bgtz", "$t0", "true_" + std::to_string(label), "if $t0=0");
				write("la", "$a0", "false_msg", "load 'false'");
				write("j", "after_" + std::to_string(label), "else");
				write("true_" + std::to_string(label) + ":");
				write("la", "$a0", "true_msg", "load 'true'");
				write("after_" + std::to_string(label) + ":");
				write("li", "$v0", "4", "write string function");
				write("syscall", "do the write string");
			}
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

		virtual void MultOp(std::string op, ExpRecord dest,
			ExpRecord lop, ExpRecord rop)
		{
			std::string instruction;
			if (TokenType::tok_real == lop.type)
			{
				BinaryOpFloat(op, dest, lop, rop);
				return;
			}

			switch (op[0])
			{
			case '*':
				instruction = "mult";
				break;

			case '/':
				instruction = "div";
				break;

			case 'm': // mod
				instruction = "div";
				break;

			}
			load_reg("$t0", lop, "load left op");
			load_reg("$t1", rop, "load right op");

			write(instruction, "$t0", "$t1", "mult op");

			if ('m' == op[0])
				write("mfhi", "$t2", "get result from special reg");
			else
				write("mflo", "$t2", "get result from special reg");

			store_reg("$t2", dest, "store result");
		}

		void BinaryOpFloat(std::string op, ExpRecord dest,
			ExpRecord lop, ExpRecord rop)
		{
			std::string instruction;
			bool compare = false;

			switch (op[0])
			{
			case '+':
				instruction = "add.s";
				break;

			case '-':
				instruction = "sub.s";
				break;

			case '*':
				instruction = "mul.s";
				break;

			case '/':
				instruction = "div.s";
				break;

			case '<':
			case '>':
			case '=':
				CompareFloat(op, dest, lop, rop);
				return;
			}

			load_reg("$f0", lop, "load left op");
			load_reg("$f1", rop, "load right op");

			write(instruction, "$f2", "$f0", "$f1", "binary op");

			store_reg("$f2", dest, "store result");
		}

		void CompareFloat(std::string op, ExpRecord dest,
			ExpRecord lop, ExpRecord rop)
		{
			std::string instruction;
			switch (op[0])
			{
			case '<':
				instruction = "c.lt.s";
				break;

			case '>':
			{
				instruction = "c.lt.s";
				ExpRecord temp = lop;
				lop = rop;
				rop = temp;
			}
				break;

			case '=':
				instruction = "c.eq.s";
				break;

			}
			load_reg("$f0", lop, "load left op");
			load_reg("$f1", rop, "load right op");

			write(instruction, "$f0", "$f1", "compare floats");
			int loc = NextCodeLocation();
			std::string t = "br_t_" + std::to_string(loc);
			write("bc1t", t, "jump on true");
			write("add", "$t0", "$0", "$0", "false in t0");
			std::string end = "br_end_" + std::to_string(loc);
			write("j", end, "jump past true case");
			write(t + ":");
			write("li", "$t0", "1", "true in t0");
			write(end + ":");

			store_reg("$t0", dest, "store result");

		}

		virtual void BinaryOp(std::string op, ExpRecord dest,
			ExpRecord lop, ExpRecord rop)
		{
			if (TokenType::tok_real == lop.type)
			{
				BinaryOpFloat(op, dest, lop, rop);
				return;
			}

			std::string instruction;
			bool invert = false;

			switch (op[0])
			{
			case '+':
				instruction = "addu";
				break;

			case '-':
				instruction = "sub";
				break;

			case '<':
				instruction = "slt";
				break;
			
			case '>':
			{
				instruction = "slt";
				// swap left, right so we can just test less than.
				ExpRecord er = lop;
				lop = rop;
				rop = er;
			}
				break;

			case '=':
				instruction = "sub";
				invert = true;
				break;

			case 'a': // and
				instruction = "and";
				break;

			case 'o': // or
				instruction = "or";
				break;

			default:
				invert = false;
				break;

			}
			load_reg("$t0", lop, "load left op");
			load_reg("$t1", rop, "load right op");

			write(instruction, "$t2", "$t0", "$t1", "binary op");
			
			if (invert)
			{
				write("sltu", "$t2", "$0", "$t2", "are they not equal?");
				write("xori", "$t2", "$t2", "1", "now shows if equal");
			}
			
			store_reg("$t2", dest, "store result");
		}

		virtual void UnaryOp(std::string op, ExpRecord dest, ExpRecord er)
		{
			std::string instruction;


			switch (op[0])
			{
			case ':': // assignment
				load_reg("$t0", er, "load op");
				store_reg("$t0", dest, "assignment");
				break;

			case 'n': // not
				load_reg("$t0", er, "load op");
				write("xori", "$t1", "$t0", "1", "not operator");
				store_reg("$t1", dest, "store result");
				break;

			case 'r': // read

				if (TokenType::tok_integer == dest.type)
				{
					write("li", "$v0", "5", "read integer function");
					write("syscall", "do the read");
					store_reg("$v0", dest, "store result");
				}
				else if (TokenType::tok_real == dest.type)
				{
					write("li", "$v0", "6", "read float function");
					write("syscall", "do the read");
					store_reg("$f0", dest, "store result");
				}
				break;
			}

		}

		virtual int BeginWhile()
		{
			int loc = NextCodeLocation();
			std::string label = "while_" + std::to_string(loc) + ':';
			write(label, "before the while expression");
			return loc;
		}

		virtual void EndWhile(int loc)
		{
			std::string label = "while_" + std::to_string(loc);
			write("j", label, "jump to start of while");
		}
		virtual int BeginIf(ExpRecord er)
		{
			int loc = NextCodeLocation();
			load_reg("$t0", er, "load if expression");
			std::string label = "if_" + std::to_string(loc);
			write("beq", "$t0", "$0", label, "jump past when false");
			return loc;
		}

		virtual void EndIf(int loc)
		{
			std::string label = "if_" + std::to_string(loc) + ':';
			write(label, "after the if block");
		}

		void index_array(std::string dest, Location loc, Location index,
			std::string comment)
		{
			load_reg("$t5", index, "load index");
			write("sll", "$t5", "$t5", "2", "index to size");
			write("addu", "$t5", "$t5", std::to_string(loc.offset), "final offset");

			std::string fp = "$fp";
			if (loc.depth > 0)
			{
				fp = "$t4";
				write("addu", "$t4", "$fp", "$0", "prepare to walk frames");
				for (int i = 0; i < loc.depth; i++)
				{
					write("lw", "$t4", "12($t4)", "next frame");
				}
			}
			write("addu", dest, fp, "$t5", comment);
		}
		void load_reg_address(std::string dest, Location loc, std::string comment)
		{
			std::string fp = "$fp";

			if (loc.depth > 0)
			{
				fp = "$t4";
				write("addu", "$t4", "$fp", "$0", "prepare to walk frames");
				for (int i = 0; i < loc.depth; i++)
				{
					write("lw", "$t4", "12($t4)", "next frame");
				}
			}
			write("la", dest, std::to_string(loc.offset) + '(' + fp + ')',
				comment);
		}

		void load_reg(std::string dest, Location loc, std::string comment)
		{
			std::string fp = "$fp";
			int offset = loc.offset;

			if (loc.depth > 0)
			{
				fp = "$t4";
				write("addu", "$t4", "$fp", "$0", "prepare to walk frames");
				for (int i = 0; i < loc.depth; i++)
				{
					write("lw", "$t4", "12($t4)", "next frame");
				}
			}
			if (loc.pointer)
			{
				// put the address in $t4 and use $t4[0] instead of fp[offset]
				write("lw", "$t4", std::to_string(loc.offset) + '(' + fp + ')',
					comment);
				fp = "$t4";
				offset = 0;
			}
			if (('f' == dest[1]) && !('p' == dest[2]))
			{
				write("l.s", dest, std::to_string(offset) + '(' + fp + ')',
					comment);
			}
			else
			{
				write("lw", dest, std::to_string(offset) + '(' + fp + ')',
					comment);
			}
		}

		void store_reg(std::string src, Location loc, std::string comment)
		{
			std::string fp = "$fp";
			if (loc.depth > 0)
			{
				fp = "$t4";
				write("addu", "$t4", "$fp", "$0", "prepare to walk frames");
				for (int i = 0; i < loc.depth; i++)
				{
					write("lw", "$t4", "12($t4)", "next frame");
				}
			}
			std::string mem = std::to_string(loc.offset) + '(' + fp + ')';
			if (loc.pointer)
			{
				write("lw", "$t4", mem, "deref pointer");
				mem = "0($t4)";
			}
			if (('f' == src[1]) && !('p' == src[2]))
			{
				write("s.s", src, mem, comment);
			}
			else
			{
				write("sw", src, mem, comment);
			}
		}

		virtual void CallProcedure(ProcedureSymbol& symbol, int depth)
		{
			write("addiu", "$sp", "$sp", "-4", "space for parent fp");
			std::string fp = "$fp";
			if (depth > 0)
			{
				write("addu", "$t4", "$fp", "$0", "prepare to walk frames");
				for (int i = 0; i < depth; i++)
				{
					write("lw", "$t4", "12($t4)", "next frame");
				}
				fp = "$t4";
			}
			write("sw", fp, "4($sp)", "push parent frame");
			write("jal", symbol.label(), "call user procedure");

			int param_space = 4;
			for(auto param : symbol.params())
			{
				// out parameters?
				param_space += 4;
			}
			if (param_space > 0)
			{
				write("addiu", "$sp", "$sp", 
					std::to_string(param_space), "pop params");
			}
		}

		virtual void PassParameter(ExpRecord er, bool out)
		{
			if (out)
			{
				Location loc(er.depth, er.offset, er.type, true);
				// store address
				write("addiu", "$sp", "$sp", "-4", "make space");
				load_reg_address("$t0", loc, "load param");
				write("sw", "$t0", "4($sp)", "push param");
			}
			else
			{
				int size = 4;
				write("addiu", "$sp", "$sp", std::to_string(-size), "make space");
				load_reg("$t0", er, "load param");
				write("sw", "$t0", std::to_string(size) + "($sp)", "push param");
			}
		}

		// ArrayReference adds the location in arr to the offset in index
		// to create a new location at runtime.
		//
		virtual ExpRecord ArrayReference(ExpRecord arr, ExpRecord index)
		{
			ExpRecord er = Location(0, LocalVariable(arr.type), arr.type);
			index_array("$t2", arr, index, "array ref");
			store_reg("$t2", er, "save address");
			er.pointer = true;
			return er;
		}

		virtual ExpRecord Literal(TokenType type, const std::string& lex)
		{
			std::string literal = lex;

			ExpRecord er;
			er.type = type;

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
			{
				er.type = TokenType::tok_real;
				int loc = NextCodeLocation();
				std::string label = "real_" + std::to_string(loc);
				_data << label << ": .float " << lex << std::endl;
				er = Location(0, LocalVariable(er.type), er.type);
				write("lw", "$t0", label, "load a real const from glbl data");
				store_reg("$t0", er, "move literal to memory");
				return er;
			}
				break;
			}
			er = Location(0, LocalVariable(er.type), er.type);
			write("li", "$t0", literal, "place a literal in register");
			store_reg("$t0", er, "move literal to memory");
			return er;
		}

		virtual int LocalVariable(TokenType type)
		{
			int loc = _nextLocal;
			_nextLocal -= 4;
			return loc;
		}
		virtual int LocalArray(TokenType type, int count)
		{
			int size = 4 + count * 4;
			_nextLocal -= size;
			return _nextLocal + 4;
		}
		virtual int Parameter(TokenType type)
		{
			int loc = _nextParam;
			_nextParam += 4;
			return loc;
		}

		virtual int NextCodeLocation()
		{
			return _nextProcedure++;
		}

		virtual void OnNewLine(int line)
		{
			write("# source line #" + std::to_string(line));
		}

	};

	char* prolog = "# MIPS assembly generated from BADA source.\n"
		".data\n"
		"enter_msg : .asciiz	\"\\nbegin program\\n\"\n"
		"exit_msg : .asciiz \"\\nend program\\n\"\n"
		"true_msg : .asciiz \"true\"\n"
		"false_msg : .asciiz \"false\"\n"
		"\n# user string literals:\n";
	
	char* epilog1 = 
		"\n# end user procedures.\n\n"
		"main:\n		# program entry point\n"
		"	addiu $sp, $sp, -12		# space for stack frame\n"
		"	addu $fp, $sp, $0		# init frame\n"
		"	sw $0 12($fp)	# initial pfp is null\n"
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


Code* MakeCodeGen(std::string name)
{
	return new MipsCode(name);
}