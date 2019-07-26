#
# ~/.zshrc
#

# Load grml config.
source ~/.grml-zsh

# Manage dotfiles.
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

##
# grml-zsh-config
#
autoload -U colors && colors
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%{${fg[white]}%}[%{${fg[green]}%}%b%{${fg[yellow]}%}%m%u%c%{$reset_color%}%{${fg[white]}%}]%{$reset_color%} "

zstyle ':prompt:grml:left:setup' items rc change-root path vcs percent
