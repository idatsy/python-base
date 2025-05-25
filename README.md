# Template Python Repository

This repository provides a minimal yet opinionated starting point for Python
projects. It bundles common development tools and a GitHub Actions workflow so
you can focus on writing code rather than configuring your environment.

## Features

- **Poetry** for dependency management
- **Ruff** for formatting and linting
- **Pyright** for static type checking
- **Pytest** for unit tests
- **Wily** for complexity metrics
- **GitHub Actions** for CI (lint, tests and complexity analysis)
- **Makefile** with handy developer commands

## Getting Started

1. **Replace** all occurrences of `template` with your project name. This is
   primarily in `pyproject.toml` and the `template/` package directory.
2. **Install dependencies**:

   ```bash
   poetry install
   ```
3. **Run code checks** (formatting, linting and type checking):

   ```bash
   make check
   ```
4. **Execute tests**:

   ```bash
   make test
   ```

## Common Makefile Commands

- **Format code**: `make format`
- **Run linter**: `make lint`
- **Auto-fix lint issues**: `make lint-fix`
- **Type check**: `make typecheck`
- **Watch tests**: `make watch`
- **Show all commands**: `make help`

## Continuous Integration

The included GitHub Actions workflow runs linting, type checks, unit tests and
complexity analysis for every push and pull request.

