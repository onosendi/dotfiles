#!/bin/bash

# Default values
PORT=3000
SERVER=dev

# Parse named parameters
for arg in "$@"; do
  case $arg in
    port=*)
      PORT="${arg#*=}"
      ;;
    server=*)
      SERVER="${arg#*=}"
      ;;
  esac
done

# Create SSH tunnel
ssh -D $PORT -f -C -q -N $SERVER

echo "All data sent through port $PORT will now be forwarded through the $SERVER server."
