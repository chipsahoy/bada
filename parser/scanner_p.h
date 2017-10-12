#ifndef scanner_p_h
#define scanner_p_h

#include <cstdio>
#include "token.h"

// This is the private header for the scanner. The public interface is
// scanner.h

class Scanner {
private:
	FILE* file; // the file we are scanning
	int lineNumber = 1;
	bool pushBack = false; // a flag to reuse the current character.
	// remember one character history for backtracking.
	int previousChar = 0;
	int GetChar(); // returns the next character
	void UnGetChar(); // sets the flag to reuse the previous character.
	// This function sorts the keywords from identifiers.
	Token MakeIdOrKeyword(std::string id, int line);
public:
	// construct a scanner from a FILE*.
	// the class could be extended to have other constructors for other
	// streams without touching GetToken().
	Scanner(FILE* file);
	// This is the only part the user sees or wants: a stream of tokens.
	Token GetToken();
};


#endif
