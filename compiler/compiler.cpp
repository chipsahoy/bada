// Paul Woodward gx6439 - cs4110 - assignment 1 symbol tables

#include <string>
#include <iostream>
#include <cassert>

#include "SymbolTable.h"

// This test program demonstrates that the symbol table functions all work.
// The primary test mechanism is assert() to verify results are as expected.
// The symbol table is also printed twice -- once in the middle and once at the
// end of the program -- for visual verification that it is a symbol table.

int main(int argc, char* argv[])
{
	SymbolTable symbols;
	std::string tokens[] = {"a", "b", "c", "d", "a_longer_token", 
		"aa", "AA", "bb", "BB", "abcd"};
	symbols.BeginScope(); // 0
	
	// test: empty table, lookup in current context, find null
	auto symbol = symbols.GetLocalSymbol(tokens[0]);
	assert(nullptr == symbol);
	
	//	test: empty table, lookup in all, find null
	symbol = symbols.SearchForSymbol(tokens[0]);
	assert(nullptr == symbol);
	
	//	test: put symbol, lookup symbol in current context, find it
	auto variableA = symbols.AddSymbol(tokens[0], SymbolType::VARIABLE);
	symbol = symbols.GetLocalSymbol(tokens[0]);
	assert(variableA == symbol);

	//	test: lookup symbol in all, find it
	symbol = symbols.SearchForSymbol(tokens[0]);
	assert(variableA == symbol);
	
	//	test: lookup diff in current, fail
	symbol = symbols.GetLocalSymbol(tokens[1]);
	assert(nullptr == symbol);

	//	test: lookup diff in all, fail
	symbol = symbols.SearchForSymbol(tokens[1]);
	assert(nullptr == symbol);

	symbols.BeginScope(); // 1
	//	test: open new context, lookup symbol in current, fail
	symbol = symbols.GetLocalSymbol(tokens[0]);
	assert(nullptr == symbol);

	//	test: lookup symbol in all, find it
	symbol = symbols.SearchForSymbol(tokens[0]);
	assert(variableA == symbol);

	//	put same symbol in new context
	auto functionA = symbols.AddSymbol(tokens[0], SymbolType::FUNCTION);

	//	test: lookup symbol in current, verify local
	symbol = symbols.GetLocalSymbol(tokens[0]);
	assert(functionA == symbol);

	//	test: lookup symbol in all, verify local
	symbol = symbols.SearchForSymbol(tokens[0]);
	assert(functionA == symbol);

	symbols.EndScope(); // 1
	std::cout << 
		"Printing symbol table with some open and some closed scopes.\n\n" 
		<< symbols.ToString();

	symbols.BeginScope(); // 2
	//	test: lookup symbol in all, verify original is returned
	// and not from the just closed scope.
	symbol = symbols.SearchForSymbol(tokens[0]);
	assert(variableA == symbol);
	symbols.EndScope(); // 2

	//	test: put a bunch of symbols in
	symbols.BeginScope(); // 3
	for (std::string token : tokens) {
		symbols.AddSymbol(token, SymbolType::FUNCTION);
	}
	symbols.EndScope(); // 3
	symbols.EndScope(); // 0

	std::cout << "Printing at end of program.\n\n" << symbols.ToString();

    return 0;
}

