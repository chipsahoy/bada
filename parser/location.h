#ifndef location_h
#define location_h

#include "token.h"

class Location
{
private:
	int _depth;
	int _offset;
	TokenType _type;
	bool _pointer;
public:
	Location(int d, int offset, TokenType type, bool pointer = false);
	int depth() const;
	int offset() const;
	TokenType type() const;
	bool pointer() const;
	std::string ToString() const;
};

#endif
