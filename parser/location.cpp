#include <sstream>

#include "location.h"

Location::Location(int d, int offset, TokenType type, bool pointer) :
	_depth(d),
	_offset(offset),
	_pointer(pointer),
	_type(type)
{
}

int Location::depth() const
{
	return _depth;
}

int Location::offset() const
{
	return _offset;
}

TokenType Location::type() const
{
	return _type;
}

bool Location::pointer() const
{
	return _pointer;
}

std::string Location::ToString() const
{
	std::stringstream ss;
	ss << _depth << ":" << _offset;
	return ss.str();
}
