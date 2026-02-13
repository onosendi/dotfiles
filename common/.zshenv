# ~/.zshenv

# ---------------------------------
# Path Configuration
# ---------------------------------

# Function to safely add directories to PATH
add_to_path() {
  if [ -d "$1" ]; then
    export PATH="$1:$PATH"
  fi
}

# Add directories to PATH
add_to_path "$HOME/.bin"
add_to_path "$HOME/.android/android-sdk/platform-tools"
add_to_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
add_to_path "/usr/local/share/python"
add_to_path "$HOME/.poetry/bin"
add_to_path "$HOME/homebrew/bin"
add_to_path "$HOME/.local/bin"

# ---------------------------------
# Development Environment Variables
# ---------------------------------

# NVM configuration
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
fi

# Python virtualenv configuration
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv

# Package configuration
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/Cellar/zlib/1.2.11/lib/pkgconfig/

# ---------------------------------
# Editor Configuration
# ---------------------------------
export EDITOR="nvim"
export VISUAL="nvim"
