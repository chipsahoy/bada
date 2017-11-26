#include <sstream>

#include "Symbol.h"
#include "token.h"
#include "location.h"

Symbol::Symbol(const std::string& name, const TokenType type, int offset) :
	_name(name), _type(type), _offset(offset)
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

int Symbol::offset() const
{
	return _offset;
}


std::string Symbol::ToString() const
{
	std::stringstream ss;
	ss << _offset << '\t';
	ss << DescribeTokenType(_type) << ": " << _name;
	return ss.str();
}

VariableSymbol::VariableSymbol(const std::string & name, const TokenType type, 
	int location, bool c, bool o) :

	Symbol(name, type, location),
	constant(c),
	array(false),
	count(0),
	out(o)
{
}

VariableSymbol::VariableSymbol(const std::string & name, const TokenType type, 
	int location, int c) :

	Symbol(name, type, location),
	out(false),
	constant(false),
	array(true),
	count(c)
{
}


ProcedureSymbol::ProcedureSymbol(std::string name, 
	int location) :
	
	Symbol(name, TokenType::tok_procedure, location)
{
}

void ProcedureSymbol::AddParam(const param_info & info)
{
	_paramTypes.push_back(info);
}

const std::vector<param_info>& ProcedureSymbol::params() const
{
	return _paramTypes;
}

std::string ProcedureSymbol::label() const
{
	std::stringstream ss;
	ss << name() << '_' << offset();
	return ss.str();
}
