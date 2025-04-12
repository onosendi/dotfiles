#!/bin/bash
CONFIG_DIR="$HOME/.devtunnel"
SERVER="dev"  # Default server
mkdir -p "$CONFIG_DIR"

function start_forwarding() {
    project=$1
    server=$2  # Accept server as parameter
    config_file="$CONFIG_DIR/$project"
    
    if [ ! -f "$config_file" ]; then
        echo "Project $project not found"
        exit 1
    fi
    
    # Read each line from the config file
    while IFS= read -r line || [[ -n "$line" ]]; do
        # Skip empty lines and comments
        [[ -z "$line" || "$line" =~ ^#.*$ ]] && continue
        
        # Split the line into local port, server, and remote port
        IFS=':' read -r local_port remote_server remote_port <<< "$line"
        
        # Start SSH tunnel in the background
        ssh -N -L "$local_port:$remote_server:$remote_port" "$server" &
        
        # Store the PID in a file for later stopping
        echo $! >> "$CONFIG_DIR/$project.pids"
        
        echo "Started forwarding $local_port:$remote_server:$remote_port through the $server server"
    done < "$config_file"
}

function stop_forwarding() {
    project=$1
    pids_file="$CONFIG_DIR/$project.pids"
    
    if [ ! -f "$pids_file" ]; then
        echo "No active forwarding for project $project"
        exit 1
    fi
    
    # Check and kill each process
    while IFS= read -r pid || [[ -n "$pid" ]]; do
        # Verify the process exists
        if ! ps -p "$pid" > /dev/null; then
            echo "Process $pid no longer exists, skipping"
            continue
        fi
        
        # Verify it's an SSH process with -N -L options
        if ps -p "$pid" -o command= | grep -q "ssh -N -L"; then
            kill "$pid" 2>/dev/null
            echo "Stopped forwarding process $pid"
        else
            echo "Warning: Process $pid is not an SSH tunnel, skipping"
        fi
    done < "$pids_file"
    
    # Remove the PID file
    rm "$pids_file"
}

# Parse all arguments before executing commands
CMD=""
PROJECT=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        start|stop|list)
            CMD="$1"
            shift
            ;;
        -s|--server)
            SERVER="$2"
            shift 2
            ;;
        --server=*)
            SERVER="${1#*=}"
            shift
            ;;
        -*)
            echo "Unknown option: $1"
            exit 1
            ;;
        *)
            if [[ -z "$PROJECT" ]]; then
                PROJECT="$1"
            fi
            shift
            ;;
    esac
done

# Execute the appropriate command
case "$CMD" in
    start)
        start_forwarding "$PROJECT" "$SERVER"
        ;;
    stop)
        stop_forwarding "$PROJECT"
        ;;
    list)
        ls -1 "$CONFIG_DIR" | grep -v "\.pids$"
        ;;
    *)
        echo "Usage: $0 start|stop|list <project-name> [-s|--server <server-address>]"
        exit 1
        ;;
esac
