#!/bin/bash
# Initialize new project from template by replacing placeholder names.
# Usage: run this script from the repository root after creating a new repo
# from the template. The script will infer the project name from the
# repository directory and push a commit with the updated names to main.

set -euo pipefail

OLD_NAME="template"

# Determine project name from repo root directory
PROJECT_NAME="$(basename "$(git rev-parse --show-toplevel)")"
# Convert any dashes to underscores for the Python package
NEW_NAME="${PROJECT_NAME//-/_}"

# Rename package directory
if [ -d "$OLD_NAME" ]; then
    git mv "$OLD_NAME" "$NEW_NAME"
fi

# Rename test file if it exists
if [ -f "tests/test_${OLD_NAME}.py" ]; then
    git mv "tests/test_${OLD_NAME}.py" "tests/test_${NEW_NAME}.py"
fi

# Replace occurrences in key project files
FILES=(pyproject.toml README.md Makefile .github/workflows/ci.yml)
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        sed -i -E "s/\b${OLD_NAME}\b/${NEW_NAME}/g" "$file"
    fi
done

# Update README header with project name
sed -i "1s/.*/# ${PROJECT_NAME}/" README.md

# Commit and push using existing git credentials

git add -A
git commit -m "Initialize project with name $NEW_NAME"
git push -f origin main
