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

std::string DescribeTokenType(TokenType type)
{
	std::string description;
	switch (type) {
	case TokenType::eof:
		description = "EOF";
		break;

	case TokenType::error:
		description = "scanner error";
		break;

	case TokenType::identifier:
		description = "identifier";
		break;


	case TokenType::literal_string:
		description = "string";
		break;

	case TokenType::literal_boolean:
		description = "boolean";
		break;

	case TokenType::literal_integer:
		description = "number";
		break;

	case TokenType::literal_real:
		description = "number";
		break;


	case TokenType::tok_integer:
		description = "integer";
		break;

	case TokenType::tok_real:
		description = "real";
		break;

	case TokenType::tok_boolean:
		description = "boolean";
		break;


	case TokenType::op_add:
		description = "math operator";
		break;

	case TokenType::op_multiply:
		description = "math operator";
		break;

	case TokenType::op_relational:
		description = "relational operator";
		break;


	case TokenType::op_assignment:
		description = "assignment operator";
		break;

	case TokenType::semicolon:
		description = "semicolon";
		break;

	case TokenType::colon:
		description = "colon";
		break;

	case TokenType::left_paren:
		description = "left parenthesis";
		break;

	case TokenType::right_paren:
		description = "right parenthesis";
		break;


	case TokenType::tok_procedure:
		description = "PROC";
		break;

	case TokenType::tok_is:
		description = "IS";
		break;

	case TokenType::tok_declare:
		description = "DECLARE";
		break;

	case TokenType::tok_constant:
		description = "CONST";
		break;

	case TokenType::op_not:
		description = "NOT";
		break;

	case TokenType::tok_if:
		description = "IF";
		break;

	case TokenType::tok_then:
		description = "THEN";
		break;

	case TokenType::tok_while:
		description = "WHILE";
		break;

	case TokenType::tok_loop:
		description = "LOOP";
		break;

	case TokenType::tok_put:
		description = "PUT";
		break;

	case TokenType::tok_put_line:
		description = "PUTLINE";
		break;

	case TokenType::tok_get:
		description = "GET";
		break;

	case TokenType::tok_begin:
		description = "BEGIN";
		break;

	case TokenType::tok_end:
		description = "END";
		break;

	default:
		description = "*** ADD DESCRIPTION";
		break;

	}
	return description;
}

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
