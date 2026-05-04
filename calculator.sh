#!/bin/bash

# Function to log the calculation to a history file
log_history() {
  echo "$1" >> history.txt
}

# Check for the correct number of arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 operand1 operator operand2"
  exit 1
fi

# Store command-line arguments in variables
num1="$1"
operator="$2"
num2="$3"

# Initialize result variable
result=0

# Perform calculation using case statement
case "$operator" in
  +)
    result=$(echo "${num1} + ${num2}" | bc)
    ;;  
  -)
    result=$(echo "${num1} - ${num2}" | bc)
    ;;  
  \*)
    result=$(echo "${num1} * ${num2}" | bc)
    ;;  
  /)
    if [ "$num2" -eq 0 ]; then
      echo "Error: Division by zero"
      exit 1
    else
      result=$(echo "${num1} / ${num2}" | bc)
    fi
    ;;  
  *)
    echo "Error: Unsupported operator '$operator'"
    exit 1
    ;;  
esac

# Output the result to the console
echo "Result: $result"

# Log the calculation to the history file
log_history "$num1 $operator $num2 = $result"