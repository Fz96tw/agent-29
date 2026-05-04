# Command-Line Calculator in Bash

## Overview
This script provides a simple command-line calculator for basic arithmetic operations such as addition and subtraction.

## Usage
To run the calculator, use the command:
```
./calculator.sh <num1> <operator> <num2>
```
For example:
```
./calculator.sh 5 + 3
```

## Input Format
The script expects three arguments:
1. Two operands (numbers).
2. One operator (e.g., + or -).
The format should be: `number operator number`.

## Supported Operators
- `+` for addition
- `-` for subtraction

## Output
The result of the operation will be printed to the console. Additionally, each operation will be appended to a file `history.txt`.

## Error Handling
The script handles the following cases:
- If the incorrect number of arguments is provided, it displays: "Usage: ./calculator.sh num1 operator num2"
- If an unsupported operator is used, it shows: "Unsupported operator: {operator}"

## History Management
All operations are recorded in `history.txt`. Each entry is logged as `num1 operator num2 = result`. Ensure there are no concurrent writes to maintain data consistency.

## Examples
### Example Command Execution
Input:
```
./calculator.sh 4 + 5
```
Output:
```
Result: 9
History: "4 + 5 = 9" in history.txt
```