#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H

#include <string>
#include <vector>
#include <deque>
#include <memory>
#include "Symbol.h"
#include "ScopeTable.h"

// This class is the interface to symbol tables for the compiler.
// It keeps a stack of currently open scopes. The ScopeTable class
// owns the symbols.
//
// shared_ptr is used to eliminate the need to call delete.
//
// Errors (precondition fail) are signaled by throwing a string. 
// It's simple and better than ignoring errors.

class SymbolTable
{
private:
	// this is the source of the unique serial numbers for scopes.
	int _nextScopeNumber = 0;
	// These are the active scopes, in a stack.
	// use a vector for easy enumeration.
	std::vector<std::shared_ptr<ScopeTable> > _scopes;
	// These are the inactive scopes, for reference.
	std::deque<std::shared_ptr<ScopeTable> > _oldScopes;
public:
	SymbolTable();
	~SymbolTable();

	// precondition: there is a current scope open.
	// precondition: name is not a symbol in the current scope.
	// postcondition: name is a symbol in the current scope.
	// returns: a pointer to the derived class implied by type.
	std::shared_ptr<Symbol> AddSymbol(const std::string& name, SymbolType t);

	// precondition: there is a current scope open.
	// returns: a pointer to the symbol record 
	//     or nullptr if name doesn't exist in the current scope.
	std::shared_ptr<Symbol> GetLocalSymbol(const std::string& name);

	std::string ToString() const;

	// precondition: there is a current scope open.
	// returns: a pointer to the symbol record 
	//     or nullptr if name doesn't exist in any open scope.
	std::shared_ptr<Symbol> SearchForSymbol(const std::string& name);

	// precondition: none
	// postcondition: a new scope is open and becomes the current scope.
	void BeginScope();

	// precondition: there is a current scope open.
	// postcondition: the current scope is moved from the stack to _oldScopes.
	void EndScope();
};

#endif
