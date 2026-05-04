#!/bin/bash

append_history() {
    local operation="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    {
        flock -n 200 || { echo 'Failed to acquire lock'; return; }
        echo "[$timestamp] $operation" >> history.txt
    } 200>history.lock
}

# Example usage
# result=$(expr 5 + 3)
# append_history "5 + 3 = $result"