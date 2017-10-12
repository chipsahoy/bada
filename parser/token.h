#ifndef token_h
#define token_h
#include <string>

// here are all the tokens, in an enum class for type safety.
enum class TokenType {
	eof = -1,
	error,
	identifier,

	literal_string,
	literal_boolean,
	literal_integer,
	literal_real,

	tok_integer,
	tok_real,
	tok_boolean,

	op_add,
	op_multiply,
	op_relational,


	op_assignment,
	semicolon,
	colon,
	left_paren,
	right_paren,

	tok_procedure,
	tok_is,
	tok_declare,
	tok_constant,
	op_not,
	tok_if,
	tok_then,
	tok_while,
	tok_loop,
	tok_put,
	tok_put_line,
	tok_get,
	tok_begin,
	tok_end,

};

// this is the Token class. It remembers the type and lexeme.
// It knows how to serialize itself and print itself.

class Token final
{
private:
	TokenType type;
	int lineNumber;
	std::string lexeme;

public:
	Token(TokenType t, std::string lex, int line);
	TokenType Type() const; // the type of the token.
	std::string Lexeme() const; // the lex string of the token.
	int Line() const; // the line number of the token.
	// ToString provides a human readable view of the token.
	std::string ToString() const;
	// serialization operators so we can read/write Token to file.
	friend std::ostream& operator<<(std::ostream& output, const Token& token);
	friend std::istream& operator>>(std::istream& input, Token& token);
};
#endif
