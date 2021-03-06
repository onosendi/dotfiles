if [ -d "$HOME/.bin" ]; then
  export PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.android-sdk/platform-tools" ]; then
  export PATH="$HOME/.android-sdk/platform-tools:$PATH"
fi

if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo:$PATH"
fi

if [ -d "$HOME/.gem/ruby/2.7.0/bin" ]; then
  export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
fi

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
fi

if [ -d "$HOME/.poetry/bin" ]; then
  export PATH="$HOME/.poetry/bin:$PATH"
fi
