#ifndef SYMBOL_H
#define SYMBOL_H
#include <string>
#include <vector>

#include "token.h"
#include "location.h"

// This is the base class for all symbol types.
// every symbol has a name, location, and type at least.
//
// The name is given and stored.
//
// The type is a discriminant that lets the user know
// which derived class they can down cast to for access to
// type specific features.
//
// The location information is implied by the ScopeTable that
// stores the symbol.
//
// The constructor is protected to force the use of a derived class.
// Only the SymbolTable class gets to create Symbols. The benefit
// is this guarantees any symbol exists in its proper scope, there
// aren't rogue context-less symbols floating around. The drawback of
// this decision is the SymbolTable has to know how to create all the
// different Symbol types which feels a bit shady. Another issue is
// the symbols can't be created fully initialized. This isn't as much
// of an issue because symbols will naturally want to mutate as more
// information accumulates in the different stages of compilation.

class Symbol
{
private:
	// name and type are fundamental to all symbols and are immutable
	// by design, enforced by private and const.
	const std::string _name;
	const TokenType _type;
	const Location _location;
protected:
public:
	Symbol(const std::string& name, const TokenType type, Location location);
	// The destructor needs to be virtual for when delete is called on a 
	// Symbol* for a derived class.
	virtual ~Symbol(); 
	// This base class is immutable so these methods have no preconditions.
	std::string name() const;
	TokenType type() const;
	Location location() const;
	// A symbol prints itself with ToString.
	std::string ToString() const;

};

class VariableSymbol : public Symbol
{
	const bool _isConstant;
	const bool _isOut;
public:
	VariableSymbol(const std::string& name, const TokenType type, 
		Location location, bool constant, bool out);
	bool constant() const;
	bool out() const;
};

struct param_info
{
	std::string name;
	TokenType type;
	bool out;
};

class ProcedureSymbol : public Symbol
{
	std::vector<param_info> _paramTypes;
	std::string _label;

public:
	ProcedureSymbol(std::string name, Location l);
	void AddParam(const param_info& info);
	const std::vector<param_info>& params() const;
	std::string label() const;
};
#endif

