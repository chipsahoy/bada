#include <string>
#include <iostream>
#include <fstream>
#pragma warning(disable:4996) // disclamer: crt file functions are dangerous!

#include "scanner.h"


// This is the meat of the program. Files are opened and fed to the tokenizer.
// The tokens are written to the screen and a file. Then an error count is
// reported.
//
// There are a lot of different approaches to buffering when reading the file.
// A stack overflow survey found up to a 20x performance difference between
// them, but the differences are in opaque layers which vary by platform so
// there isn't an obvious right answer.
//
// This code uses getc() which is the simplist approach and performed well in
// the survey. Instead of trying to put the ketchup back in the bottle, back
// tracking is done by caching the previous character and a flag to back track.
//
// Notice there are no global variables. One benefit is it can scan multiple
// files at the same time. The key to making this work is the GetChar function
// which is a lambda. It captures the line number and push back variables from
// the scan() context.
//
// line numbers are handled entirely here and not at all in GetToken. The
// reason is GetToken is in the business of scanning BADA tokens. Line numbers 
// aren't a part of that business. This scan() function already is touching
// every file character exactly once. Counting line numbers is a good fit here.

static void scan(std::string filename)
{
	FILE* file = fopen(filename.c_str(), "r");
	if (nullptr == file) {
		std::cout << "unable to open file " << filename << std::endl;
		return;
	}

	// GetChar increments lineNumber when it pulls a new line.
	int lineNumber = 1;
	// GetToken calls PushBack to reuse the previous character.
	bool pushBack = false;
	// remember one character history for backtracking.
	int previousChar;

	// This is GetChar, a lambda function. It captures file,
	// lineNumber, pushBack, previousChar.
	auto GetChar = [&]() -> int {
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
		// lineNumber will understand \r, \n, \r\n - the common newline styles.
		if (('\n' == ch) && ('\r' != previousChar))
			lineNumber++;
		if ('\r' == ch)
			lineNumber++;
		// cache the latest character for backtracking.
		previousChar = ch;
		return ch;
	};

	auto PushBack = [&]() {
		pushBack = true;
	};

	// Let the user know which file is being scanned now.
	std::cout << "Scanning " << filename << std::endl;
	// open a file to write the tokens into.
	std::ofstream output(filename + ".tok");

	int errorCount = 0;

	while (true) {
		Token token = GetToken(GetChar, PushBack);
		// add the line number to the token.
		int line = lineNumber;
		if (pushBack) {
			if (('\r' == previousChar) | ('\n' == previousChar))
				line--;
		}
		token.line(line);
		// display this token on string.
		std::cout << token.ToString() << std::endl;

		if (token.type() == TokenType::error) {
			errorCount++;
		}
		else {
			// write the token to the token file.
			// but only if it isn't an error.
			output << token;
		}
		if (token.type() == TokenType::eof) 
			break;
	}
	fclose(file);

	// let the user know the file is finished and the results.
	std::cout << filename << " " << errorCount << 
		((1 == errorCount) ? " error." : " errors.") << std::endl;

}

// main will attempt to scan() every file name passed in on the command line.

int main(int argc, char* argv[])
{
	if (1 == argc) 
		std::cout << "usage: scanner filename\n";
	
	for(int i = 1; i < argc; i++)
		scan(argv[i]);

	return 0;
}
