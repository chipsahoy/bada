#include <string>
#include <iostream>
#include <fstream>
#pragma warning(disable:4996) // crt file functions are dangerous!

#include "scanner.h"
#include "parser.h"
#include "codegen.h"

// process() parse one file and write the results to an output file.
//
static void process(std::string filename)
{
	FILE* file = fopen(filename.c_str(), "r");
	if (nullptr == file) {
		std::cout << "unable to open file " << filename << std::endl;
		return;
	}
	// Let the user know which file is being scanned now.
	std::cout << "Parsing " << filename << std::endl;

	// open a file to write the tree into.
	std::ofstream output(filename + ".tree");
	output << "derivation of " << filename << std::endl;
	auto GetToken = CreateScanner(file);
	std::unique_ptr<Code> code(MakeCodeGen(filename + ".asm"));
	std::string error;
	std::string tree = parse(GetToken, *code, error);

	if (error.size() == 0) 
		output << tree << std::endl;
	else 
	{
		std::cout << "*** " << error << std::endl;
		output << "*** " << error << std::endl;
	}

	fclose(file);
}

// main will attempt to parse() every file name passed in on the command line.

int main(int argc, char* argv[])
{
	if (1 == argc) 
		std::cout << "usage: parser filename\n";
	
	for(int i = 1; i < argc; i++)
		process(argv[i]);

	return 0;
}
