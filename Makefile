.PHONY: lint run test check

sync:
	poetry install --with dev --sync

format:
	poetry run ruff format . --config .ruffrc

lint: format
	poetry run ruff . --fix-only --config .ruffrc

dev:
	poetry run ptw --runner "pytest --testmon"

run:
	poetry run python -m src

test: lint
	poetry run pytest -n auto --dist worksteal --durations=100 > test_times.txt

check: lint
	poetry run mypy --config-file mypy.ini src/

check-right: lint
	poetry run pyright

check-right-json:
	poetry run pyright --outputjson > pyright.json