#ifndef location_h
#define location_h

#include "token.h"

class Location
{
private:
	int _depth;
	int _offset;
	TokenType _type;
public:
	Location(int d, int offset, TokenType type);
	int depth() const;
	int offset() const;
	TokenType type() const;
	std::string ToString() const;
};

#endif
