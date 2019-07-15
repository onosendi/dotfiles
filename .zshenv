# Export ~/.bin to $PATH
if [ -d "$HOME/.bin" ]; then
    export PATH="$HOME/.bin:$PATH"
fi
