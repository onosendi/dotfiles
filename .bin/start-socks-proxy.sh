#!/bin/bash

PORT=3000
SERVER=dev

show_help() {
  echo "Usage: $(basename "$0") [options]"
  echo
  echo "SOCKS proxy utility to create an SSH dynamic port forwarding tunnel"
  echo
  echo "Options:"
  echo "  -p, --port=PORT      Local port to use for SOCKS proxy (default: $PORT)"
  echo "  -s, --server=NAME    Server to connect to (default: $SERVER)"
  echo "  -h, --help           Display this help message"
  echo
  echo "Example:"
  echo "  $(basename "$0") -p 8080 -s jumphost"
  echo "  $(basename "$0") --port=8080 --server=jumphost"
  echo
  echo "This will create a SOCKS proxy on localhost:8080 through the jumphost server"
  echo "Configure your applications to use localhost:8080 as a SOCKS proxy to route traffic"
}

while [ $# -gt 0 ]; do
  case "$1" in
    -p|--port=*)
      if [[ "$1" == *"="* ]]; then
        PORT="${1#*=}"
      else
        PORT="$2"
        shift
      fi
      ;;
    -s|--server=*)
      if [[ "$1" == *"="* ]]; then
        SERVER="${1#*=}"
      else
        SERVER="$2"
        shift
      fi
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      show_help
      exit 1
      ;;
  esac
  shift
done

ssh -D $PORT -f -C -q -N $SERVER
echo "All data sent through port $PORT will now be forwarded through the $SERVER server."
