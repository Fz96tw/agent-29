#!/bin/bash

# Simple Bash Calculator Script

if [ $# -lt 3 ]; then
    echo "Usage: $0 num1 operator num2"
    exit 1
fi

num1=$1
operator=$2
num2=$3

case $operator in
    +)
        result=$(echo "$num1 + $num2" | bc)
        echo "Result: $result"
        echo "$num1 + $num2 = $result" >> history.txt
        ;;  
    -)
        result=$(echo "$num1 - $num2" | bc)
        echo "Result: $result"
        echo "$num1 - $num2 = $result" >> history.txt
        ;;  
    *)
        echo "Unsupported operator: $operator"
        exit 1
        ;;  
esac

# Add more operators as needed.