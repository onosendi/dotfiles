# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------
# Plugin Manager: Zinit
# ------------------------------------------
source ~/.local/share/zinit/zinit.git/zinit.zsh

# ------------------------------------------
# Plugins:
# ------------------------------------------

# Syntax highlighting (fast + async)
zinit light zdharma-continuum/fast-syntax-highlighting

# Autosuggestions (fish-style)
zinit light zsh-users/zsh-autosuggestions
bindkey -M viins '^G' autosuggest-accept

# Completion extensions
zinit light zsh-users/zsh-completions

# Frecent directory jumping (like `z`)
zinit light rupa/z

# Git helpers (aliases + prompt info)
zinit snippet OMZ::plugins/git/git.plugin.zsh

# Optional: fzf keybindings + fuzzy history
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

# Optional: Powerlevel10k prompt (very fast)
zinit light romkatv/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ------------------------------------------
# Shell Behavior & Usability
# ------------------------------------------

# Use vi-mode
bindkey -v

# Clean + smart history
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt share_history
setopt hist_ignore_all_dups
setopt extended_history

# Completion config
autoload -Uz compinit && compinit -C
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Prefix history search like grml
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M viins '^[[A' up-line-or-beginning-search
bindkey -M viins '^[[B' down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# fzf config (use `fd` for better perf)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'

# Aliases
alias vim="nvim"
alias copy="wl-copy"
alias brew="sudo -Hu brew /opt/homebrew/bin/brew"
alias els='eza --group-directories-first --color=always --git'
alias l='els -l'
alias ls=els
alias la='els -la'
alias lt='els -T --level=2'

# ------------------------------------------
# Dev Environment
# ------------------------------------------

# Node Version Manager (nvm)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Auto-switch Node versions based on `.nvmrc`
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

# Python virtualenvwrapper
[ -f /opt/homebrew/bin/virtualenvwrapper.sh ] && source /opt/homebrew/bin/virtualenvwrapper.sh

# ------------------------------------------
# Path
# ------------------------------------------
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
