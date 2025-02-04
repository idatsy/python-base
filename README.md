# Template Python Repository

A minimal, conservative Python project template configured with:
- **Poetry** for dependency management
- **Ruff** for linting & formatting
- **Pyright** for type-checking
- **Pytest** for testing
- **Wily** for code complexity analysis
- **GitHub Actions** for CI (lint, test, complexity check)
- **Makefile** with handy developer commands

## Usage

- **Replace** all occurrences of "`template`" (e.g., in `pyproject.toml` and the top-level `template` directory) with your project name.
- **Install dependencies**: `poetry install`
- **Run linting**: `make lint`
- **Run type checks**: `make typecheck`
- **Run tests**: `make test`
- **View additional commands**: `make help`
