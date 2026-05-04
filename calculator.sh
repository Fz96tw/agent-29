#!/bin/bash

# Check if the number of arguments is exactly 3
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 num1 operator num2"
    exit 1
fi

# Capture arguments
num1="$1"
operator="$2"
num2="$3"

# Validate operands using regex
if ! [[ $num1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ $num2 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Invalid operand: $num1 or $num2"
    exit 1
fi

# Validate operator
if [[ ! $operator =~ ^[+\-*\/]$ ]]; then
    echo "Unsupported operator: $operator"
    exit 1
fi

# Print validated inputs (for debugging)
echo "Operands: num1=$num1, num2=$num2, Operator: $operator"

# Proceed to calculation (placeholder for further logic)
