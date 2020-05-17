if [ -d "$HOME/.bin" ]; then
  export PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.android-sdk/platform-tools" ]; then
  export PATH="$HOME/.android-sdk/platform-tools:$PATH"
fi

if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo:$PATH"
fi
