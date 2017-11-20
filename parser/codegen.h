#ifndef codegen_h
#define codegen_h

#include <string>
#include "token.h"
#include "location.h"
#include "Symbol.h"


struct ExpRecord
{
	ExpRecord() : type(TokenType::error), location(0, 0, TokenType::error)
	{}
	TokenType type;
	Location location;
};

// Code is a class that writes the generated code. It's called at the proper
// points inside the parser. This keeps the parser ignorant of all details
// about what is generated.

class Code
{
public:
	// Generate code takes the accumulated pieces and writes them to the
	// output file in proper order.
	virtual void GenerateCode(ProcedureSymbol& main) = 0;
	
	// The code generator needs to know when blocks begin and end,
	// to set up a local frame pointer. Procedures need more, they
	// end with a return and have a label.
	// 
	virtual int BeginProcedure(ProcedureSymbol& symbol) = 0;
	virtual void EndProcedure(ProcedureSymbol& symbol, int saved) = 0;

	// Blocks that aren't procedures are marked here.
	virtual int BeginScope() = 0;
	virtual void EndScope(int saved) = 0;
	
	// The next functions implement the language functionality.

	virtual void PutString(std::string msg) = 0;
	virtual void PutChar(char ch) = 0;
	virtual void PutInteger(Location loc) = 0;
	virtual void UnaryOp(std::string op, ExpRecord dest, ExpRecord er) = 0;
	virtual void BinaryOp(std::string op, ExpRecord dest, ExpRecord lop,
		ExpRecord rop) = 0;
	virtual Location BeginWhile() = 0;
	virtual void EndWhile(Location loc) = 0;
	virtual Location BeginIf(ExpRecord er) = 0;
	virtual void EndIf(Location loc) = 0;
	
	//  This method needs to find the proper frame pointer and make the call.
	virtual void CallProcedure(ProcedureSymbol& symbol) = 0;
	virtual void PassParameter(ExpRecord er, bool out) = 0;

	// These functions return the next available Location to go with a new
	// symbol. Local variables are negative offsets from the frame pointer,
	// parameters are positive offsets from the frame pointer, and
	// procedures have a serial number prepended to insure uniqueness since
	// the assembly name scope is flat but the ADA names are nested.
	//
	virtual Location LocalVariable(TokenType type) = 0;
	virtual Location Parameter(TokenType type) = 0;
	virtual Location NextCodeLocation(TokenType type) = 0;
	virtual ExpRecord Literal(TokenType type, const std::string& lex) = 0;


};

// Two different kinds of code are generated, for fun.

enum class OutputFormat
{
	MIPS,
	X86,
};

// This factory function hides the details of the implementation class
//
Code* MakeCodeGen(std::string name, OutputFormat type);

#endif
