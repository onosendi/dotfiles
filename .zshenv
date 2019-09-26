#
# ~/.zshenv
#
if [ -d "$HOME/.bin" ]; then
    export PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.android/android-sdk/platform-tools" ]; then
    export PATH="$HOME/.android/android-sdk/platform-tools:$PATH"
fi

if [ -d "/usr/local/sbin" ]; then
    export PATH="/usr/local/sbin:$PATH"
fi
