#include <string>
#include <iostream>
#include <fstream>
#pragma warning(disable:4996) // disclamer: crt file functions are dangerous!

#include "scanner.h"

// Files are opened and fed to the tokenizer.
// The tokens are written to the screen and a file. Then an error count is
// reported.

static void scan(std::string filename)
{

	FILE* file = fopen(filename.c_str(), "r");
	if (nullptr == file) {
		std::cout << "unable to open file " << filename << std::endl;
		return;
	}
	auto GetToken = CreateScanner(file);
	// Let the user know which file is being scanned now.
	std::cout << "Scanning " << filename << std::endl;

	// open a file to write the tokens into.
	std::ofstream output(filename + ".tok");

	int errorCount = 0;

	while (true) {
		Token token = GetToken();
		// display this token on screen.
		std::cout << token.ToString() << std::endl;

		if (token.Type() == TokenType::error) {
			errorCount++;
		}
		else {
			// write the token to the token file.
			// but only if it isn't an error.
			output << token;
		}
		if (token.Type() == TokenType::eof) 
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
