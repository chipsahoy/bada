#include "codegen.h"

namespace {
	class MipsCode : public Code
	{
		int _nextLocal;
		int _nextParam;
		int _nextProcedure;

	public:
		MipsCode(std::string filename) :
			_nextLocal(0),
			_nextParam(0),
			_nextProcedure(0)
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

}

Code* MakeCodeGen(std::string name, OutputFormat type)
{
	if (OutputFormat::MIPS == type) {
		return new MipsCode(name);
	}
	return nullptr;
}