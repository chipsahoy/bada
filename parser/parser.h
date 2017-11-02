#ifndef parser_h
#define parser_h
#include <string>
#include <functional>

#include "token.h"
#include "SymbolTable.h"

std::string parse(std::function<Token()> GetToken, std::string& error);
#endif
