#include <sstream>

#include "token.h"

Token::Token(TokenType t, std::string lex) : 
	_type(t), _lexeme(lex), _lineNumber(0)
{
}

// getters
TokenType Token::type() const
{
	return _type;
}

std::string Token::lexeme() const
{
	return _lexeme;
}

void Token::line(int lineNumber)
{
	_lineNumber = lineNumber;
}
int Token::line() const
{
	return _lineNumber;
}

std::string Token::ToString() const
{
	std::ostringstream ss;
	ss << "line " << _lineNumber << ": " << static_cast<int>(_type);
	if (!_lexeme.empty())
		ss << " \"" << _lexeme << "\"";
	return ss.str();
}

// serialization. Currently done as text. There is a small risk (for example
// if strings could have newlines.) The deciding factor for now is the ease
// of reading the text files produced vs the dificulty of reading binary.

std::ostream & operator<<(std::ostream& output, const Token& token)
{
	output << static_cast<int>(token._type) << "\t" << token._lineNumber << 
		"\t" << token._lexeme << '\n';
	return output;
}

// there is no error handling yet, but it's also unused code. 
// I'm going to wait to see how it is used
// and then add appropriate error handling.
std::istream & operator>>(std::istream& input, Token& token)
{
	int type;
	input >> type >> token._lineNumber;
	std::getline(input, token._lexeme);
	token._type = static_cast<TokenType>(type);
	return input;
}
