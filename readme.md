# `newpy.sh` Usage Instructions

This document provides instructions for setting up and using the `newpy.sh` script in Zsh and Fish shells on Linux. The `newpy.sh` script is designed to automate the process of cloning a base Python project, removing its `.git` directory, and initializing a new Git repository.

## Prerequisites

- Ensure you have `git` and `poetry` installed on your system.
- The `newpy.sh` script should be placed in a directory that is in your system's PATH (e.g., `/usr/local/bin` or `~/bin`).

## Installation

### Make the Script Executable

```bash
chmod +x /path/to/newpy.sh
```

### Zsh Setup

1. **Add Alias in `.zshrc`:**

    Open the `.zshrc` file in your home directory:

    ```bash
    nano ~/.zshrc
    ```

    Add the following line:

    ```bash
    alias newpy='/path/to/newpy.sh'
    ```

2. **Reload Zsh Configuration:**

    ```bash
    source ~/.zshrc
    ```

### Fish Setup

1. **Create a Function:**

    Open a Fish shell session and define a new function:

    ```fish
    function newpy
        /path/to/newpy.sh $argv
    end
    ```

2. **Save the Function:**

    ```fish
    funcsave newpy
    ```

## Usage

- **In Zsh or Fish Shell:**

    Run the script with the project name as an argument:

    ```bash
    newpy project-name
    ```

    This will create a new project with the specified name, clone the base Python project, and set up a new Git repository.



