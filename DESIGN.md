# AGENT-29 — Technical Design

# Technical Design

## Overview
The project is a simple command-line calculator implemented as a Bash shell script. It should accept two operands and an operator via command-line arguments and output the result. Each calculation session's input and output should be recorded in a file named `history.txt`.

## Architecture
- **User Interface**: Command-line interface where users input calculation expressions as arguments.
- **Bash Script**: Core logic implemented to parse arguments, perform calculations, and handle file operations.
- **File System**: `history.txt` to store operation history.

## Components
### 1. Command-line Argument Parsing
- Parse the command-line input to extract two operands and one operator.
- Validate the arguments to ensure correct format and valid operations (e.g., addition, subtraction, multiplication, division).

### 2. Calculation Module
- Perform calculations based on the parsed operator and operands.
- Use native Bash arithmetic operations for basic operations (`+`, `-`, `*`, `/`).

### 3. History Management
- Append the input operands, operator, and corresponding results to a text file `history.txt`.
- Handle file operations to ensure concurrency does not corrupt the history file.

## Data Flow
1. **Input**: Accept operands and operator from the command line.
2. **Processing**: Compute the result based on the extracted operator and operands.
3. **Output**: Print the calculated result to the console and save input-output data to `history.txt`.

## Key Decisions
- Use of Bash script due to simplicity and direct support for command-line operations.
- Input validation is essential to prevent errors due to incorrect user input.
- File handling in Bash requires careful attention to ensure data integrity.

## Code Example
```bash
#!/bin/bash

# Function to append to history file
function append_history {
  echo "$1" >> history.txt
}

# Check correct number of arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 num1 operator num2"
  exit 1
fi

num1=$1
operator=$2
num2=$3

result=""  # store the calculation result

# Perform the calculation
case $operator in
  +)
    result=$(echo "$num1 + $num2" | bc)
    ;;
  -)
    result=$(echo "$num1 - $num2" | bc)
    ;;
  \\*)
    result=$(echo "$num1 * $num2" | bc)
    ;;
  /)
    result=$(echo "$num1 / $num2" | bc)
    ;;
  *)
    echo "Unsupported operator: $operator"
    exit 1
    ;;
esac

# Output the result
echo "Result: $result"

# Append to history
append_history "$num1 $operator $num2 = $result"
```
