#include <fstream>

#include "codegen.h"
extern char* code_prolog;
extern char* code_epilog1;
extern char* code_epilog2;

namespace {
	class X86Code : public Code
	{
		int _nextLocal;
		int _nextParam;
		int _nextProcedure;
		std::string _filename;
		std::ofstream _file;

	protected:
		void write(std::string s)
		{
			_file << s << std::endl;
		}
		void write(std::string command, std::string param, std::string comment)
		{
			_file << command << '\t' << param << "\t\t\t; " << comment << std::endl;
		}
		void write(std::string command, std::string param1, std::string param2,
			std::string param3, std::string comment)
		{
			_file << command << '\t' << param1 << 
				", " << param2 << ", " << param3 <<
				"\t\t\t; " << comment << std::endl;
		}

	public:
		X86Code(std::string filename) :
			_nextLocal(0),
			_nextParam(0),
			_nextProcedure(0),
			_filename(filename)
		{

		}
		virtual void GenerateCode(ProcedureSymbol& main)
		{
			_file.open(_filename);
			write(code_prolog);
			write(code_epilog1);
			CallProcedure(main, 0);
			write(code_epilog2);
		}

		virtual void PutString(std::string msg)
		{
			write("fn", "write_string", 
				std::to_string(msg.size()), '"' + msg.c_str() + '"', 
				"invoke write_string");
		}

		virtual void PutChar(char ch)
		{
		}

		virtual void PutNumber(Location loc)
		{
		}
		virtual void MultOp(std::string op, ExpRecord dest,
			ExpRecord lop, ExpRecord rop)
		{

		}

		virtual void BinaryOp(std::string op, ExpRecord dest, 
			ExpRecord lop, ExpRecord rop)
		{
			write(op);
		}
		virtual void UnaryOp(std::string op, ExpRecord dest, ExpRecord er)
		{

		}
		virtual int BeginWhile()
		{
			int loc = NextCodeLocation();
			return loc;
		}

		virtual void EndWhile(int loc)
		{

		}
		virtual int BeginIf(ExpRecord er)
		{
			int loc = NextCodeLocation();
			return loc;
		}

		virtual void EndIf(int loc)
		{

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
			write(symbol.label(), "proc", "begin user procedure");
			return 0;
		}

		virtual void EndProcedure(ProcedureSymbol& symbol, int saved)
		{
			write("ret");
			write(symbol.label(), "endp", "end user procedure");

		}

		virtual void CallProcedure(ProcedureSymbol& symbol, int depth)
		{
			write("call", symbol.label(), "call a user procedure");
		}

		virtual void PassParameter(ExpRecord er, bool out)
		{

		}

		virtual ExpRecord ArrayReference(ExpRecord arr, ExpRecord index)
		{
			ExpRecord er;
			return er;
		}


		virtual ExpRecord Literal(TokenType type, const std::string& lex)
		{
			ExpRecord er;
			switch (type)
			{
			case TokenType::literal_boolean:
				er.type = TokenType::tok_boolean;
				break;

			case TokenType::literal_integer:
				er.type = TokenType::tok_integer;
				break;

			case TokenType::literal_real:
				er.type = TokenType::tok_real;
				break;
			}
			er = Location(0, LocalVariable(er.type), type);
			return er;
		}


		virtual int LocalVariable(TokenType type)
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
			return loc;

		}
		virtual int NextCodeLocation()
		{
			return _nextProcedure++;
		}

		virtual void OnNewLine(int line)
		{

		}

	};

}

Code* MakeX86Gen(std::string name)
{
	return new X86Code(name);
}

char* code_prolog =
"\n"
".386\n"
".model flat, C\n"
"\n"
"PUBLIC asm_main\n"
"\n"
"write_string proto stdcall, nsize:dword, buf: ptr byte\n"
"ExitProcess proto stdcall, dwExitCode:dword\n"
"GetStdHandle proto stdcall, nStdHandle : dword\n"
"WriteFile proto stdcall, hFile : dword, buf : dword, count : dword, written : dword, overlapped : dword\n"
"\n"
"STD_INPUT_HANDLE equ - 10\n"
"STD_OUTPUT_HANDLE equ - 11\n"
"STD_ERROR_HANDLE equ - 12\n"
"\n"
".data\n"
"\n"
"stdout dd ?\n"
"stdin dd ?\n"
"stderr dd ?\n"
"\n"
"enter_msg	db 'Begin program.', 10, 10\n"
"enter_size	equ $ - enter_msg\n"
"exit_msg	db 'End program.', 10\n"
"exit_size equ $ - exit_msg\n"
"\n"
".code\n"
"\n";

char* code_epilog1 =
"; function write_string\n"
"; params: buffer, size\n"
"; writes to stdout\n"
"\n"
"write_string proc\n"
"push ebp\n"
"mov ebp, esp\n"
"sub esp, 4; written\n"
"\n"
"push 0; overlapped\n"
"lea eax, [ebp - 4]\n"
"push eax; &written\n"
"mov eax, [ebp + 12]\n"
"push eax; count\n"
"mov eax, [ebp + 8]\n"
"push eax; buffer\n"
"mov eax, [stdout]\n"
"push eax; hfile\n"
"call WriteFile\n"
"\n"
"add esp, 4\n"
"pop ebp\n"
"ret 8\n"
"write_string endp\n"
"\n"
"read_bool proc\n"
"read_bool endp\n"
"\n"
"read_int proc\n"
"read_int endp\n"
"\n"
"read_float proc\n"
"read_float endp\n"
"\n"
"; function asm_init\n"
"; paramaters: none.\n"
"; initializes global state and prints a welcome message.\n"
"\n"
"asm_init proc\n"
"mov eax, STD_OUTPUT_HANDLE\n"
"push eax\n"
"call GetStdHandle\n"
"mov stdout, eax\n"
"\n"
"mov eax, STD_INPUT_HANDLE\n"
"push eax\n"
"call GetStdHandle\n"
"mov stdin, eax\n"
"\n"
"mov eax, STD_ERROR_HANDLE\n"
"push eax\n"
"call GetStdHandle\n"
"mov stderr, eax\n"
"\n"
"mov eax, enter_size\n"
"push eax\n"
"lea eax, enter_msg\n"
"push eax\n"
"call write_string\n"
"ret\n"
"asm_init endp\n"
"\n"
"asm_main proc\n"
"push ebp\n"
"mov ebp, esp\n"
"\n"
"call asm_init\n"
"\n"
;

char* code_epilog2 =
"\n"
"mov eax, exit_size\n"
"push eax\n"
"lea eax, exit_msg\n"
"push eax\n"
"call write_string\n"
"\n"
"push 0\n"
"call ExitProcess\n"
"asm_main endp\n"
"\n"
"end\n";
