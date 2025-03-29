#!/bin/bash

# Check if a file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <overtime_file>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

# Initialize variables
total_hours=0
month_hours=()
month_names=("January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")

# Process each line of the file
while IFS= read -r line || [ -n "$line" ]; do
    # Skip empty lines
    if [ -z "$line" ]; then
        continue
    fi
    
    # Extract date and hours using regex
    if [[ $line =~ ([0-9]+)[[:space:]]+([A-Za-z]+):[[:space:]]*([0-9]+(\.[0-9]+)?) ]]; then
        day=${BASH_REMATCH[1]}
        month=${BASH_REMATCH[2]}
        hours=${BASH_REMATCH[3]}
        
        # Convert month name to number (1-based)
        month_num=0
        for i in "${!month_names[@]}"; do
            if [[ ${month_names[$i]} == *"$month"* ]]; then
                month_num=$((i+1))
                break
            fi
        done
        
        # Add hours to total
        total_hours=$(echo "$total_hours + $hours" | bc)
        
        # Add hours to month total
        if [ ${#month_hours[@]} -lt $month_num ]; then
            # Pad array with zeros if needed
            while [ ${#month_hours[@]} -lt $month_num ]; do
                month_hours+=(0)
            done
        fi
        
        month_hours[$((month_num-1))]=$(echo "${month_hours[$((month_num-1))]} + $hours" | bc)
        
        echo "Added $hours hours from $day $month. Running total: $total_hours hours"
    else
        echo "Warning: Could not parse line: $line"
    fi
done < "$1"

# Display results
echo -e "\n--- Summary ---"
echo "Total overtime: $total_hours hours"
echo -e "\nBy month:"
for i in "${!month_hours[@]}"; do
    if (( $(echo "${month_hours[$i]} > 0" | bc -l) )); then
        echo "${month_names[$i]}: ${month_hours[$i]} hours"
    fi
done
