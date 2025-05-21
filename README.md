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

- **Initialize the repo**: `./scripts/init_repo.sh`
  This replaces the placeholder package name using the repository's name and
  pushes the changes to `main`.
- **Install dependencies**: `poetry install`
- **Run linting**: `make lint`
- **Run type checks**: `make typecheck`
- **Run tests**: `make test`
- **View additional commands**: `make help`
