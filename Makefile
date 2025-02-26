.PHONY: help
.DEFAULT_GOAL := help

## -- Development Commands --
install: ## Install project dependencies
	poetry install

format: ## Format code using ruff
	poetry run ruff format .

lint: ## Run linting using ruff
	poetry run ruff check .

lint-fix: ## Run linting with automatic fixes
	poetry run ruff check --fix .

typecheck: ## Run static type checking
	poetry run pyright

docstring: ## Check docstring style and completeness
	poetry run ruff check . --select D,PD

style: ## Check code style (without docstrings)
	poetry run ruff check . --select E,W,F,I,N,UP,B,C4,SIM,TCH

fix: format lint-fix ## Run all formatters and fixers

check: fix typecheck ## Run all checks (lint and typecheck)

sync: ## Sync dependencies and install
	poetry update
	poetry lock
	poetry install

clean: ## Clean build artifacts and caches
	rm -rf .ruff_cache/
	rm -rf .mypy_cache/
	rm -rf .pytest_cache/
	rm -rf dist/
	rm -rf build/
	find . -type d -name __pycache__ -exec rm -rf {} +

test: ## Run tests
	poetry run pytest -p no:anchorpy

stats: ## Show code quality statistics
	@echo "=== Docstring Coverage ==="
	@poetry run ruff check . --select D --statistics
	@echo "\n=== Missing Type Hints ==="
	@poetry run ruff check . --select ANN --statistics
	@echo "\n=== Style Issues ==="
	@poetry run ruff check . --select E,W,F,I,N --statistics

# Default test command components
TEST_FLAGS := -xvv -s -p no:anchorpy

# Watch target that accepts an optional path argument
.PHONY: watch
watch:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		poetry run ptw --runner "poetry run pytest $(TEST_FLAGS) -W ignore::DeprecationWarning" --config "ptw.ini"; \
	else \
		path_arg="$(filter-out $@,$(MAKECMDGOALS))";\
		poetry run ptw --runner "poetry run pytest tests/$$path_arg $(TEST_FLAGS) -W ignore::DeprecationWarning" --config "ptx.ini";\
	fi

# This pattern rule handles any additional arguments
%:
	@:

help: ## Display this help message
	@echo 'Usage:'
	@echo '  make <target>'
	@echo ''
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

run:
	poetry run python -m template