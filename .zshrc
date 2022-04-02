#
# ~/.zshrc
#

# Load grml config.
source ~/.grml-zsh

# Manage dotfiles.
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias global-dotfiles="/usr/bin/git --git-dir=$HOME/.global-dotfiles/ --work-tree=$HOME"

alias vim="/usr/local/bin/nvim"

##
# grml-zsh-config
#
autoload -U colors && colors
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%{${fg[cyan]}%}[%{$reset_color%}%{${fg_bold[red]}%}%b%{$reset_color%}%{${fg_bold[yellow]}%}%m%u%c%{$reset_color%}%{${fg[cyan]}%}]%{$reset_color%} "

source /usr/local/bin/virtualenvwrapper.sh
function virtual_env_prompt () {
  REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}
grml_theme_add_token virtual-env -f virtual_env_prompt '%F{yellow}' '%f'

zstyle ':prompt:grml:left:setup' items rc change-root virtual-env path vcs percent

# Use vi mode
bindkey -v

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git/'

# For Node Version Manager.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
