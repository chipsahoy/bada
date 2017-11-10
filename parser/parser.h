#ifndef parser_h
#define parser_h
#include <string>
#include <functional>

#include "token.h"
#include "SymbolTable.h"
#include "codegen.h"

std::string parse(std::function<Token()> GetToken, Code& c, std::string& error);
#endif
