#!/bin/bash

append_history() {
    echo "$1" >> history.txt
}

# Initialize Variables
num1="${1}"
num2="${2}"
operator="${3}"

# Input Validation
if [ "$#" -ne 3 ]; then
    echo "Usage: ./calculator.sh <num1> <operator> <num2>"
    exit 1
fi

# Check if Operands are Numeric
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Both operands must be valid numbers."
    exit 1
fi

# Perform the Calculation
case "$operator" in
    "+")
        result=$(echo "$num1 + $num2" | bc)
        ;;  
    "-")
        result=$(echo "$num1 - $num2" | bc)
        ;;  
    "*")
        result=$(echo "$num1 * $num2" | bc)
        ;;  
    "/")
        # Handle Division by Zero
        if [ "${num2}" -eq 0 ]; then
            echo "Error: Division by zero."
            exit 1
        fi
        result=$(echo "$num1 / $num2" | bc)
        ;;  
    *)
        echo "Error: Unsupported operator '$operator'."
        exit 1
        ;; 
esac

# Output the Result
echo "Result: $result"

# Append Calculation to History
append_history "$num1 $operator $num2 = $result"