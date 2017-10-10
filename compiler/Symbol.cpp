#include "Symbol.h"
#include <sstream>
static std::string PrintType(SymbolType type);

Symbol::Symbol(const std::string& name, const SymbolType type) :
	_name(name), _type(type)
{
}

Symbol::~Symbol()
{
}

std::string Symbol::name() const
{
	return _name;
}

SymbolType Symbol::type() const
{
	return _type;
}

std::string Symbol::ToString() const
{
	std::stringstream ss;
	ss << PrintType(_type) << ": " << _name;
	return ss.str();
}

FunctionSymbol::FunctionSymbol(const std::string& name) : Symbol(name, SymbolType::FUNCTION)
{
}

VariableSymbol::VariableSymbol(const std::string& name) : Symbol(name, SymbolType::VARIABLE)
{
}

std::string PrintType(SymbolType type)
{
	switch (type) {
	case SymbolType::FUNCTION:
		return "function";

	case SymbolType::VARIABLE:
		return "variable";

	default:
		return "undefined type";
	}
}

