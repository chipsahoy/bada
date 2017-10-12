#include "scanner.h"
#include "scanner_p.h"

// input: a file opened, ready for scanning
// return: a GetToken function that will scan and return tokens.

std::function<Token()> CreateScanner(FILE* file)
{
	// The hidden Scanner class holds the 'global' variables for this scanner.
	Scanner* scanner = new Scanner(file);
	std::function<Token()> GetToken = std::bind(&Scanner::GetToken, scanner);
	return GetToken;
}

Scanner::Scanner(FILE* f) : file(f) 
{
}

// There are a lot of different approaches to buffering when reading the file.
// A stack overflow survey found up to a 20x performance difference between
// them, but the differences are in opaque layers which vary by platform so
// there isn't an obvious right answer.
//
// This code uses getc() which is the simplist approach and performed well in
// the survey. Instead of trying to put the ketchup back in the bottle, back
// tracking is done by caching the previous character and a flag to back track.

int Scanner::GetChar()
{	
	if (pushBack) {
		pushBack = false;
		return previousChar;
	}
	int ch = getc(file);
	// ch will be EOF for EOF, but it's also EOF for other file errors.
	if ((EOF == ch) && ferror(file)) {
		// todo: notify and handle error in larger program.
		perror("*** error scanning file.\n");
	}
	return ch;
}

void Scanner::UnGetChar()
{
	pushBack = true;
	if (('\r' == previousChar) | ('\n' == previousChar))
		lineNumber--;
}

