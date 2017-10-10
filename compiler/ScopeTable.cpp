#include "ScopeTable.h"
#include <sstream>


ScopeTable::ScopeTable(int scopeNumber) : _scopeNumber(scopeNumber)
{
}


ScopeTable::~ScopeTable()
{
}

void ScopeTable::AddSymbol(std::shared_ptr<Symbol> symbol)
{
	if (nullptr == symbol)
		throw "failure: added a null symbol";
	auto it = _symbols.find(symbol->name());
	if (_symbols.end() != it) {
		throw "duplicate symbol: " + symbol->name();
	}

	// adding to a map is easy thanks to operator [].
	_symbols[symbol->name()] = symbol;
}

std::shared_ptr<Symbol> ScopeTable::FindSymbol(const std::string& name)
{
	// it is an iterator for map: a key-value pair.
	auto it = _symbols.find(name);
	if (_symbols.end() == it) {
		return nullptr;
	}
	// return the value, a Symbol*
	return it->second;
}

std::string ScopeTable::ToString() const
{
	std::stringstream ss;
	ss << "Scope " << _scopeNumber << std::endl;

	// have each symbol in this scope print itself.
	for (const auto& key_value : _symbols) {
		ss << key_value.second->ToString() << std::endl;
	}
	ss << std::endl;
	return ss.str();
}
