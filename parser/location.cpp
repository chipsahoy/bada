#include <sstream>

#include "location.h"

Location::Location(int d, int offset, TokenType type, bool pointer) :
	depth(d),
	offset(offset),
	pointer(pointer),
	constant(false),
	type(type)
{
}
Location::Location() : Location(0, 0, TokenType::error, false)
{

}

std::string Location::ToString() const
{
	std::stringstream ss;
	ss << depth << ":" << offset;
	return ss.str();
}
