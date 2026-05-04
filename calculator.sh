#!/bin/bash

# Simple command-line calculator

# Function to log history
log_history() {
    echo "$1" >> history.txt
}

# Usage function
usage() {
    echo "Usage: $0 num1 operator num2"
}

# Check number of arguments
if [ $# -ne 3 ]; then
    usage
    exit 1
fi

num1=$1
operator=$2
num2=$3

# Perform calculation
case $operator in
    +)
        result=$((num1 + num2))
    ;;
    -)
        result=$((num1 - num2))
    ;;
    \*)
        result=$((num1 * num2))
    ;;
    /)
        if [ $num2 -eq 0 ]; then
            echo "Error: Division by zero"
            exit 1
        fi
        result=$((num1 / num2))
    ;;
    *)
        echo "Unsupported operator: $operator"
        exit 1
    ;;
esac

# Output result
echo "Result: $result"
log_history "$num1 $operator $num2 = $result"
