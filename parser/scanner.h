#ifndef scanner_h
#define scanner_h

#include <functional>
#include <cstdio>
#include "token.h"

// this is the public interface for the scanner.

// CreateScanner is a factory that returns a scanner function.
//
// input: an open file for reading.
// return: a GetToken() function that will scan the file.
// errors: none. If file is not readable that will show up using GetToken.
std::function<Token()> CreateScanner(FILE* file);

#endif
