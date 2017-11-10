#ifndef codegen_h
#define codegen_h

#include <string>
#include "token.h"
#include "location.h"

class Code
{
public:
	virtual int BeginScope() = 0;
	virtual void EndScope(int saved) = 0;
	virtual Location LocalVariable(TokenType type) = 0;
	virtual Location Parameter(TokenType type) = 0;
	virtual Location Procedure(std::string name) = 0;
	//

};

enum class OutputFormat
{
	MIPS,
	X86,
};
Code* MakeCodeGen(std::string name, OutputFormat type);

#endif
