if [ $# -eq 0 ]; then
    lsof -iTCP -sTCP:LISTEN -n -P
elif [ $# -eq 1 ]; then
    lsof -iTCP -sTCP:LISTEN -n -P | rg $1
else
    echo "Usage: listening [pattern]"
fi
