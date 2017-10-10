#ifndef SYMBOL_H
#define SYMBOL_H
#include <string>
enum class SymbolType; // defined later.


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
	const SymbolType _type;
protected:
	Symbol(const std::string& name, const SymbolType type);
public:
	// The destructor needs to be virtual for when delete is called on a 
	// Symbol* for a derived class.
	virtual ~Symbol(); 
	// This base class is immutable so these methods have no preconditions.
	std::string name() const;
	SymbolType type() const;
	// A symbol prints itself with ToString.
	std::string ToString() const;

};

// These are the types of symbols we know in our language.
enum class SymbolType {
	VARIABLE,
	FUNCTION,
};

// This stub is here so we can test multiple symbol types.
class VariableSymbol : public Symbol
{
public:
	VariableSymbol(const std::string& name);
};

// This stub is here so we can test multiple symbol types.
class FunctionSymbol : public Symbol
{
public:
	FunctionSymbol(const std::string& name);
};

#endif

