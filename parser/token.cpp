#include <sstream>

#include "token.h"

Token::Token(TokenType t, std::string lex, int line) : 
	type(t), lexeme(lex), lineNumber(line)
{
}

// getters
TokenType Token::Type() const
{
	return type;
}

std::string Token::Lexeme() const
{
	return lexeme;
}

int Token::Line() const
{
	return lineNumber;
}

std::string Token::ToString() const
{
	std::ostringstream ss;
	ss << "line " << lineNumber << ": " << static_cast<int>(type);
	if (!lexeme.empty())
		ss << " \"" << lexeme << "\"";
	return ss.str();
}

// serialization. Currently done as text. There is a small risk (for example
// if strings could have newlines.) The deciding factor for now is the ease
// of reading the text files produced vs the dificulty of reading binary.

std::ostream & operator<<(std::ostream& output, const Token& token)
{
	output << static_cast<int>(token.type) << "\t" << token.lineNumber << 
		"\t" << token.lexeme << '\n';
	return output;
}

// there is no error handling reading from a stream, but it's also unused code. 
// I'm going to wait to see how it is used
// and then add appropriate error handling.
std::istream & operator>>(std::istream& input, Token& token)
{
	int type;
	input >> type >> token.lineNumber;
	std::getline(input, token.lexeme);
	token.type = static_cast<TokenType>(type);
	return input;
}
