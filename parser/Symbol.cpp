#include <sstream>

#include "Symbol.h"
#include "token.h"

Symbol::Symbol(const std::string& name, const TokenType type, int location,
	bool constant) :
	_name(name), _type(type), _location(location), _isConstant(constant)
{
}

Symbol::~Symbol()
{
}

std::string Symbol::name() const
{
	return _name;
}

TokenType Symbol::type() const
{
	return _type;
}

int Symbol::location() const
{
	return _location;
}

bool Symbol::constant() const
{
	return _isConstant;
}

std::string Symbol::ToString() const
{
	std::stringstream ss;
	ss << _location << '\t';
	if (constant())
		ss << "constant ";
	ss << DescribeTokenType(_type) << ": " << _name;
	return ss.str();
}



