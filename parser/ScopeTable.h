#ifndef SCOPETABLE_H
#define SCOPETABLE_H

#include <map>
#include <memory>
#include "Symbol.h"

// A scope table owns the symbols defined in a particular scope.
// It is used exclusively by SymbolTable, not for public consumption.

class ScopeTable
{
private:
	std::map<std::string, std::shared_ptr<Symbol> > _symbols;
	const int _scopeNumber;
	bool _hasFrame;
public:
	ScopeTable(int scopeNumber, bool hasFrame);
	~ScopeTable();

	int number() const;
	bool HasFrame() const;
	// precondition: symbol.name() is not a key in _symbols.
	// precondition: symbol is not null.
	// postcondition: symbol is added to _symbols.
	void AddSymbol(std::shared_ptr<Symbol> symbol);
	
	// returns a pointer to the symbol with key name or 
	// nullptr if the key is not found.
	std::shared_ptr<Symbol> FindSymbol(const std::string& name);

	// Prints the symbols in this scope.
	std::string ToString() const;
};

#endif
