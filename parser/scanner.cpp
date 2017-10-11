#include <map>
#include <algorithm>

#include "token.h"
#include "scanner.h"

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
		{"mod", TokenType::op_multpily},
		{"and", TokenType::op_multpily},
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
		{"put_line", TokenType::tok_put_line},
		{"get", TokenType::tok_get},
		{"begin", TokenType::tok_begin},
		{"end", TokenType::tok_end},
	};

	// This helper function takes a parsed id and sees if it is a keyword.
	// It also uses ::tolower() to make the case of ids and keywords uniform 
	// so the rest of the program can be case sensitive.
	//
	// input: an identifier string in any case
	// return: a token of the proper type

	Token MakeIdOrKeyword(std::string id)
	{
		// take care of case here. make all identifiers lowercase.
		std::transform(id.begin(), id.end(), id.begin(), tolower);
		auto it = keywords.find(id);
		if (it != keywords.end()) {
			return Token(it->second, id);
		}
		return Token(TokenType::identifier, id);
	}
}

// GetToken is the scanner. It implements a state machine to make tokens
// while scanning input.
//
// input: GetChar(), a function that will provide characters one at a time
// and EOF when there are no more characters.
// lineCurrent, the line number in the input file. Updated as characters are
// scanned.
//
// return: a valid token or an error token. Also PushBack is an output
// parameter that signals the last character read needs to be processed in
// the next token.

Token GetToken(std::function<int()> GetChar, std::function<void()> PushBack)
{
	// characters for the lexeme accumulate in buffer. Initializing it to 0
	// ensures it will always be null terminated.
	char buffer[256] = { 0 }; 
	// index is the next location in buffer to write to.
	int index = 0;
	// state is the current state.
	State state = State::start;

	// This loop runs the state machine.
	// There is one character read each pass through the loop.
	// the character is processed in the current state.

	while (true) {

		// Before reading check if the token has grown too large. The language
		// has a maximum of 255 characters per lexical element.
		// If we've written 256 characters then it's an error.
		if (index > 255) {
			// index is a count of characters written so 256 is bad.
			// for recovery we start fresh after ignoring these 256.
			buffer[255] = 0;
			std::string msg = "token too long";
			return Token(TokenType::error, msg);
		}

		// ch is the one character we'll deal with this pass.
		int ch = GetChar();

		switch (state) {

			// State::start is a bit special. Many tokens are only one
			// character and returned directly. If a token needs multiple
			// characters there's a transition to a different state.

		case State::start: {
			switch (ch) {
			case EOF:
				return Token(TokenType::eof, "");

			case ' ':
			case '\t':
			case '\n':
			case '\r':
				// whitespace is a valid final state but not a token.
				continue;

			case '+':
				return Token(TokenType::op_add, std::string(1, ch));

			case '*':
			case '/':
				return Token(TokenType::op_multpily, std::string(1, ch));

			case '<':
			case '>':
			case '=':
				return Token(TokenType::op_relational, std::string(1, ch));

			case ';':
				return Token(TokenType::semicolon, std::string(1, ch));

			case '(':
				return Token(TokenType::left_paren, std::string(1, ch));
			case ')':
				return Token(TokenType::right_paren, std::string(1, ch));

			default: {
				// this token might be more than one char. Needs a new state.
				index = 0;
				if ('"' == ch) { // don't save the starting quote in buffer.
					state = State::quote;
					continue;
				}
				// Start saving the token's characters in buffer.
				buffer[index++] = static_cast<char>(ch);

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
					msg + static_cast<char>(ch));
			}
			}
			break;
		}

		// State id
		// transition in: from start on alpha, from id_underscore on alpha
		// transition out: to id_underscore on underscore
		// final: on not(alpha, digit). must PushBack last.

		case State::id: {
			bool more = false;
			if (isalnum(ch)) more = true;
			if ('_' == ch) {
				more = true;
				state = State::id_underscore;
			}
			if (!more) {
				PushBack();
				return MakeIdOrKeyword(buffer);
			}
			buffer[index++] = static_cast<char>(ch);
			break;
		}

		// State id_underscore
		// transition in: from id on _
		// transition out: to id on alpha
		// error: non alpha character

		case State::id_underscore: {
			if (isalpha(ch)) {
				buffer[index++] = static_cast<char>(ch);
				state = State::id;
				break;
			}
			PushBack();
			std::string msg = "illegal identifier: ";
			return Token(TokenType::error, msg + buffer);
		}

		// State number
		// transition in: from start on digit
		// transition out: to number_dot on .
		// final: on not(dot, digit). must PushBack last.

		case State::number: {
			if (isdigit(ch)) {
				buffer[index++] = static_cast<char>(ch);
				break;
			}
			if ('.' == ch) {
				buffer[index++] = static_cast<char>(ch);
				state = State::number_dot;
				break;
			}
			PushBack();
			return Token(TokenType::literal_integer, buffer);
		}
		// State number_dot
		// transition in: from number on .
		// transition out: to real on digit
		// error: not digit

		case State::number_dot: {
			if (isdigit(ch)) {
				buffer[index++] = static_cast<char>(ch);
				state = State::real;
				break;
			}
			std::string msg = "illegal number: ";
			PushBack();
			return Token(TokenType::error, msg + buffer);
		}

		// State real
		// transition in: from number_dot on digit
		// final: on not digit. must PushBack last.

		case State::real: {
			if (isdigit(ch)) {
				buffer[index++] = static_cast<char>(ch);
				break;
			}
			PushBack();
			return Token(TokenType::literal_real, buffer);
		}

		// State quote
		// transition in: from start on "
		// final: on ". no PushBack.
		// error: EOF or newline. PushBack EOF.

		case State::quote: {
			switch (ch) {
			case '"': {
				return Token(TokenType::literal_string, 
					std::string(buffer, index));
			}
			case EOF:
				PushBack();
			case '\n':
			case '\r':
				std::string msg = "missing end quote";
				return Token(TokenType::error, msg);
			}
			buffer[index++] = static_cast<char>(ch);
			break;
		}

		// State dash
		// transition in: from start on -
		// transition out: to comment on -
		// final: not -. must PushBack.

		case State::dash: {
			if ('-' != ch) {
				PushBack();
				return Token(TokenType::op_add, "-");
			}
			state = State::comment;
			break;
		}

		// State comment
		// transition in: from dash on -
		// final: on newline or EOF. Merely reset state, there is no comment
		// token. must PushBack (to not lose EOF).

		case State::comment: {
			switch (ch) {
			case EOF:
			case '\n':
			case '\r':
				PushBack();
				state = State::start;
				break;
			}
			break;
		}

		// State colon
		// transition in: from start on :
		// final: on = no PushBack. on not = must PushBack.

		case State::colon: {
			if ('=' == ch) {
				return Token(TokenType::op_assignment, ":=");
			}
			PushBack();
			return Token(TokenType::colon, ":");
		}
		}
	}
}
