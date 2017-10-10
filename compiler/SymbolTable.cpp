#include <sstream>

#include "SymbolTable.h"

SymbolTable::SymbolTable()
{
}

SymbolTable::~SymbolTable()
{
}

std::shared_ptr<Symbol> SymbolTable::AddSymbol(const std::string& name, 
	SymbolType type)
{
	if (_scopes.empty()) {
		throw "mismatch, too many contexts closed";
	}
	auto scope = _scopes.back();
	std::shared_ptr<Symbol> symbol;
	// create a Symbol* using the derived type from SymbolType::type
	switch (type) {
	case SymbolType::FUNCTION:
		symbol = std::make_shared<FunctionSymbol>(name);
		break;

	case SymbolType::VARIABLE:
		symbol = std::make_shared<VariableSymbol>(name);
		break;

	default:
		throw "undefined symbol type";
	}
	scope->AddSymbol(symbol);
	return symbol;
}

std::shared_ptr<Symbol> SymbolTable::GetLocalSymbol(const std::string& name)
{
	// lookup in the current scope only.
	if (_scopes.empty()) {
		throw "mismatch, too many contexts closed";
	}
	auto scope = _scopes.back();
	auto symbol = scope->FindSymbol(name);
	return symbol;
}

std::shared_ptr<Symbol> SymbolTable::SearchForSymbol(const std::string& name)
{
	if (_scopes.empty()) {
		throw "mismatch, too many contexts closed";
	}
	// enumerate scopes from back to front to get the stack effect.
	auto it = _scopes.rbegin();
	while (it != _scopes.rend()) {
		auto scope = *it;
		auto symbol = scope->FindSymbol(name);
		if (nullptr != symbol) {
			// we found our symbol, stop looking and return it.
			return symbol;
		}
		it++;
	}
	return nullptr;
}

void SymbolTable::BeginScope()
{
	auto scope = std::make_shared<ScopeTable>(_nextScopeNumber++);
	_scopes.push_back(scope);
}

void SymbolTable::EndScope()
{
	if (_scopes.empty()) {
		throw "mismatch, too many contexts closed";
	}
	auto scope = _scopes.back();
	_scopes.pop_back();
	_oldScopes.push_back(scope);
}

std::string SymbolTable::ToString() const
{
	// The symbol table prints itself by delegating to each scope to print.
	std::stringstream ss;
	ss << "Begin symbol table.\n";
	if (!_oldScopes.empty()) {
		ss << "closed scopes:\n";
		for (auto scope : _oldScopes) {
			ss << scope->ToString();
		}
	}
	if (!_scopes.empty()) {
		ss << "open scopes:\n";
		for (auto scope : _scopes) {
			ss << scope->ToString();
		}
	}
	ss << "End symbol table.\n\n";
	return ss.str();
}


