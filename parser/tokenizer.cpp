#include <map>
#include <algorithm>
#include <vector>

#include "token.h"
#include "scanner_p.h"

namespace {
	// This enum of states reflects the DFA of the parser.
	// The final states are omitted. When the input leads to
	// a transition to a final state, the previous state just
	// returns a Token and the state machine resets for the
	// next token.

	// the indentation levels indicate the transitions possible.
	// the comment shows the input character that caused the
	// transition to that state.

	enum class State {
		start,
			id,	// letter
				id_underscore, // _
			number, // digit
				number_dot, // .
					real, // digit
			quote, // "
			colon, // :
			dash, // -
				comment, // -
	};

	// Here are the keywords of the language and their associated token types.
	std::map<std::string, TokenType> keywords = {
		{"true", TokenType::literal_boolean},
		{"false", TokenType::literal_boolean},
		{"or", TokenType::op_add},
		{"mod", TokenType::op_multiply},
		{"and", TokenType::op_multiply},
		{"integer", TokenType::tok_integer},
		{"float", TokenType::tok_real},
		{"boolean", TokenType::tok_boolean},
		{"procedure", TokenType::tok_procedure},
		{"is", TokenType::tok_is},
		{"declare", TokenType::tok_declare},
		{"constant", TokenType::tok_constant},
		{"not", TokenType::op_not},
		{"if", TokenType::tok_if},
		{"then", TokenType::tok_then},
		{"while", TokenType::tok_while},
		{"loop", TokenType::tok_loop},
		{"put", TokenType::tok_put},
		{"put_line", TokenType::tok_put},
		{"get", TokenType::tok_get},
		{"begin", TokenType::tok_begin},
		{"end", TokenType::tok_end},
		{"in", TokenType::tok_in},
		{"out", TokenType::tok_out},
		{"call", TokenType::tok_call},
		{"array", TokenType::tok_array},
		{"of", TokenType::tok_of},
	};
}
// This helper function takes a parsed id and sees if it is a keyword.
// It also uses ::tolower() to make the case of ids and keywords uniform 
// so the rest of the program can be case sensitive.
//
// input: an identifier string in any case
// return: a token of the proper type

Token Scanner::MakeIdOrKeyword(std::string id, int line)
{
	// take care of case here. make all identifiers lowercase.
	std::transform(id.begin(), id.end(), id.begin(), tolower);
	auto it = keywords.find(id);
	if (it != keywords.end()) {
		return Token(it->second, id, line);
	}
	return Token(TokenType::identifier, id, line);
}


// GetToken is the scanner. It implements a state machine to make tokens
// while scanning input.
//
// return: a valid token or an error token.

Token Scanner::GetToken()
{
	// characters for the lexeme accumulate in buffer.
	std::vector<char> buffer; 

	// state is the current state.
	State state = State::start;
	int line;

	// This loop runs the state machine.
	// There is one character read each pass through the loop.
	// the character is processed in the current state.

	while (true) {
		// ch is the one character we'll deal with this pass.
		// it gets handled by the current state, processed, then
		// there is a transition and we return here for the next character.
		int ch = GetChar();

		// While parsing we'll also count newlines.
		// lineNumber will understand \r, \n, \r\n - the common newline styles.
		if (('\n' == ch) && ('\r' != previousChar))
			lineNumber++;
		if ('\r' == ch)
			lineNumber++;
		// cache the latest character for backtracking.
		previousChar = ch;

		// this is the DFA, in C++
		switch (state) {

			// State::start is a bit special. Many tokens are only one
			// character and returned directly. If a token needs multiple
			// characters there's a transition to a different state.

		case State::start: {
			line = lineNumber; // remember the line the token started on.
			switch (ch) {
			case EOF:
				return Token(TokenType::eof, "", line);

			case ' ':
			case '\t':
			case '\n':
			case '\r':
				// whitespace is a valid final state but not a token.
				continue;

			case '+':
				return Token(TokenType::op_add, std::string(1, ch), line);

			case '*':
			case '/':
				return Token(TokenType::op_multiply, std::string(1, ch), line);

			case '<':
			case '>':
			case '=':
				return Token(TokenType::op_relational, std::string(1, ch), line);

			case ';':
				return Token(TokenType::semicolon, std::string(1, ch), line);

			case '(':
				return Token(TokenType::left_paren, std::string(1, ch), line);
			case ')':
				return Token(TokenType::right_paren, std::string(1, ch), line);

			case ',':
				return Token(TokenType::tok_comma, std::string(1, ch), line);

			default: {
				// this token might be more than one char. Needs a new state.
				buffer.clear();
				if ('"' == ch) { // don't save the starting quote in buffer.
					state = State::quote;
					continue;
				}
				// Start saving the token's characters in buffer.
				buffer.push_back(static_cast<char>(ch));

				if (isalpha(ch)) {
					state = State::id;
					continue;
				}
				if (isdigit(ch)) {
					state = State::number;
					continue;
				}
				if (':' == ch) {
					state = State::colon;
					continue;
				}
				if ('-' == ch) {
					state = State::dash;
					continue;
				}

				// ch isn't a valid beginning for a token.
				std::string msg = "syntax error: ";
				return Token(TokenType::error, 
					msg + static_cast<char>(ch), line);
			}
			}
			break;
		}

		// State id
		// transition in: from start on alpha, from id_underscore on alpha
		// transition out: to id_underscore on underscore
		// final: on not(alpha, digit). must UnGetChar last.
		// error: longer than 255. must pushback.

		case State::id: {
			bool more = false;
			// We rely on isalnum() to accept only the letters a-z, which
			// it will in the default C locale.
			if (isalnum(ch)) 
				more = true;
			if ('_' == ch) {
				more = true;
				state = State::id_underscore;
			}
			if (!more) {
				UnGetChar();
				// identifies must be 255 or fewer characters.
				if (buffer.size() > 255) {
					std::string lex = std::string(buffer.begin(), buffer.end());
					std::string msg = "indentifier too long: ";
					return Token(TokenType::error, msg + lex, line);
				}
				std::string id = std::string(buffer.begin(), buffer.end());
				return MakeIdOrKeyword(id, line);
			}
			buffer.push_back(static_cast<char>(ch));
			break;
		}

		// State id_underscore
		// transition in: from id on _
		// transition out: to id on alpha
		// error: non alpha character. pushback.

		case State::id_underscore: {
			buffer.push_back(static_cast<char>(ch));
			if (isalpha(ch)) {
				state = State::id;
				break;
			}
			UnGetChar();
			std::string msg = "illegal identifier: ";
			std::string lex = std::string(buffer.begin(), buffer.end());
			return Token(TokenType::error, msg + lex, line);
		}

		// State number
		// transition in: from start on digit
		// transition out: to number_dot on .
		// final: on not(dot, digit). must UnGetChar last.

		case State::number: {
			if (isdigit(ch)) {
				buffer.push_back(static_cast<char>(ch));
				break;
			}
			if ('.' == ch) {
				buffer.push_back(static_cast<char>(ch));
				state = State::number_dot;
				break;
			}
			UnGetChar();
			std::string number = std::string(buffer.begin(), buffer.end());
			return Token(TokenType::literal_integer, number, line);
		}

		// State number_dot
		// transition in: from number on .
		// transition out: to real on digit
		// error: not digit no pushback.

		case State::number_dot: {
			buffer.push_back(static_cast<char>(ch));
			if (isdigit(ch)) {
				state = State::real;
				break;
			}
			std::string msg = "illegal number: ";
			std::string number = std::string(buffer.begin(), buffer.end());
			return Token(TokenType::error, msg + number, line);
		}

		// State real
		// transition in: from number_dot on digit
		// final: on not digit. must UnGetChar last.

		case State::real: {
			if (isdigit(ch)) {
				buffer.push_back(static_cast<char>(ch));
				break;
			}
			UnGetChar();
			std::string number = std::string(buffer.begin(), buffer.end());
			return Token(TokenType::literal_real, number, line);
		}

		// State quote
		// transition in: from start on "
		// final: on ". no UnGetChar.
		// error: EOF or newline. pushback.

		case State::quote: {
			switch (ch) {
			case '"': {
				std::string lex = std::string(buffer.begin(), buffer.end());
				return Token(TokenType::literal_string, lex, line);
			}
			case EOF:
			case '\n':
			case '\r':
				UnGetChar();
				std::string msg = "missing end quote";
				return Token(TokenType::error, msg, line);
			}
			buffer.push_back(static_cast<char>(ch));
			break;
		}

		// State dash
		// transition in: from start on -
		// transition out: to comment on -
		// final: not -. must UnGetChar.

		case State::dash: {
			if ('-' != ch) {
				UnGetChar();
				return Token(TokenType::op_add, "-", line);
			}
			state = State::comment;
			break;
		}

		// State comment
		// transition in: from dash on -
		// final: on newline or EOF. Merely reset state, there is no comment
		// token. must UnGetChar.

		case State::comment: {
			switch (ch) {
			case EOF:
			case '\n':
			case '\r':
				UnGetChar();
				state = State::start;
				break;
			}
			break;
		}

		// State colon
		// transition in: from start on :
		// final: on = no UnGetChar. on not = must UnGetChar.

		case State::colon: {
			if ('=' == ch) {
				return Token(TokenType::op_assignment, ":=", line);
			}
			UnGetChar();
			return Token(TokenType::colon, ":", line);
		}
		}
	}
}
