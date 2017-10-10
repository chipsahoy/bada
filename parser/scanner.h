#ifndef parser_h
#define parser_h
#include <functional>
#include "token.h"

Token GetToken(std::function<int()> GetChar, const int& line, bool& pushBack);
#endif
