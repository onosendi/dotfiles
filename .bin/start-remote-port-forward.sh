#!/bin/bash

LOCAL_PORT=8000
REMOTE_PORT=8080
SERVER=dev

show_help() {
  echo "Usage: $(basename "$0") [options]"
  echo
  echo "Port forwarding utility to create an SSH reverse tunnel"
  echo
  echo "Options:"
  echo "  -l, --local=PORT     Local port to forward from (default: $LOCAL_PORT)"
  echo "  -r, --remote=PORT    Remote port to forward to (default: $REMOTE_PORT)"
  echo "  -s, --server=NAME    Server to connect to (default: $SERVER)"
  echo "  -h, --help           Display this help message"
  echo
  echo "Example:"
  echo "  $(basename "$0") -l 3000 -r 9090 -s production"
  echo "  $(basename "$0") local=3000 remote=9090 server=production"
  echo
  echo "This will forward port 9090 on the production server to localhost port 3000"
}

while [ $# -gt 0 ]; do
  case "$1" in
    -l|--local=*)
      if [[ "$1" == *"="* ]]; then
        LOCAL_PORT="${1#*=}"
      else
        LOCAL_PORT="$2"
        shift
      fi
      ;;
    -r|--remote=*)
      if [[ "$1" == *"="* ]]; then
        REMOTE_PORT="${1#*=}"
      else
        REMOTE_PORT="$2"
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

ssh -f -R ${REMOTE_PORT}:localhost:${LOCAL_PORT} ${SERVER} -N
echo "Started forwarding port ${REMOTE_PORT} on ${SERVER} server to localhost ${LOCAL_PORT}"
