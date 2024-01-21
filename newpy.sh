#!/bin/bash

# Check if a project name is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

PROJECT_NAME=$1
BASE_REPO_URL="https://github.com/idatsy/python-base.git"
CURRENT_DIR=$(pwd)

# Create a new project directory
PROJECT_DIR="$CURRENT_DIR/$PROJECT_NAME"
mkdir -p "$PROJECT_DIR"

# Clone the base repository
git clone "$BASE_REPO_URL" "$PROJECT_DIR" || { echo "Failed to clone repository"; exit 1; }

# Remove the original .git directory
rm -rf "$PROJECT_DIR/.git"

# Initialize a new repository
cd "$PROJECT_DIR"
git init
git add .
git commit -m "initial commit"

# Install dependencies using poetry
poetry install || { echo "Failed to run poetry install"; exit 1; }

echo "Project $PROJECT_NAME has been successfully set up."
