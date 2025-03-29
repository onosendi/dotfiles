#!/bin/bash
log_files() {
    local path="$1"
    
    # Check if path exists
    if [ ! -e "$path" ]; then
        echo "Error: $path does not exist" >&2
        return 1
    fi
    
    # If it's a directory, process recursively
    if [ -d "$path" ]; then
        # Find all files in directory and sort them, excluding node_modules and package-lock.json
        find "$path" -type f -not -path "*/node_modules/*" -not -name "package-lock.json" | sort | while read -r file; do
            echo -e "\n// $file\n"
            cat "$file"
        done
    # If it's a file, process directly (but skip if it's package-lock.json)
    elif [ -f "$path" ] && [[ "$path" != *"package-lock.json" ]]; then
        echo -e "\n// $path\n"
        cat "$path"
    fi
}

# If no arguments provided, show usage
if [ $# -eq 0 ]; then
    echo "Usage: $0 [file/directory paths...]"
    echo "Example: $0 src/foo src/bar/test.js"
    exit 1
fi

# Process all arguments
for arg in "$@"; do
    log_files "$arg"
done
