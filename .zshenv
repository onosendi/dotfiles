# Export ~/.bin to $PATH
if [ -d "$HOME/.bin" ]; then
    export PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.android-sdk/platform-tools" ]; then
    export PATH="$HOME/.android-sdk/platform-tools:$PATH"
fi
