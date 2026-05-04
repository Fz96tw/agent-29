#!/bin/bash

# Command-Line Calculator in Bash
# This script performs basic arithmetic operations.

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: ./calculator.sh num1 operator num2"
    exit 1
fi

num1=$1
operator=$2
num2=$3

# Supported operators
case "$operator" in
    +)
        result=$((num1 + num2))
        ;; 
    -)
        result=$((num1 - num2))
        ;; 
    *)
        echo "Unsupported operator: $operator"
        exit 1
        ;; 
esac

# Output the result
echo "Result: $result"

# Append to history.txt
{ echo "$num1 $operator $num2 = $result" >> history.txt; }
