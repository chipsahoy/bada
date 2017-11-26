#ifndef location_h
#define location_h

#include "token.h"

struct Location
{
public:
	Location();
	Location(int d, int offset, TokenType type, bool pointer = false);
	int depth;
	int offset;
	TokenType type;
	bool pointer;
	bool constant;
	std::string ToString() const;
};

#endif
