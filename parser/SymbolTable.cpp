#include <sstream>

#include "SymbolTable.h"
#include "token.h"

SymbolTable::SymbolTable()
{
}

SymbolTable::~SymbolTable()
{
}

std::shared_ptr<Symbol> SymbolTable::AddLocal(const std::string& name, 
	TokenType type, int location, bool constant)
{
	if (_scopes.empty()) {
		throw "mismatch, too many contexts closed";
	}
	auto scope = _scopes.back();
	std::shared_ptr<Symbol> symbol(new VariableSymbol(name, type, 
		location, constant, false));
	scope->AddSymbol(symbol);
	return symbol;
}

std::shared_ptr<Symbol> SymbolTable::AddParam(const std::string& name,
	TokenType type, int location, bool out)
{
	if (_scopes.empty()) {
		throw "mismatch, too many contexts closed";
	}
	auto scope = _scopes.back();
	std::shared_ptr<Symbol> symbol(new VariableSymbol(name, type,
		location, false, out));
	scope->AddSymbol(symbol);
	return symbol;
}


std::shared_ptr<ProcedureSymbol> SymbolTable::AddProcedure(const std::string& name,
	int location)
{
	if (_scopes.empty()) {
		throw "mismatch, too many contexts closed";
	}
	auto scope = _scopes.back();
	std::shared_ptr<ProcedureSymbol> symbol(new ProcedureSymbol(name, location));
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

std::shared_ptr<Symbol> SymbolTable::SearchForSymbol(const std::string& name,
	int& depth)
{
	if (_scopes.empty()) {
		throw "mismatch, too many contexts closed";
	}
	depth = 0;
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
		depth++;
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
	_oldScopes[scope->number()] = scope;
}

std::string SymbolTable::ToString() const
{
	// The symbol table prints itself by delegating to each scope to print.
	std::stringstream ss;
	ss << "Begin symbol table.\n";
	if (!_oldScopes.empty()) {
		ss << "closed scopes:\n";
		for (auto scopekvp : _oldScopes) {
			ss << scopekvp.second->ToString();
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


