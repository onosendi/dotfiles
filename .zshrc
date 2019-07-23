# Colorize pacman results.
alias pacman="pacman --color auto"

# Manage dotfiles.
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# By default Mutt will save attachments to the folder it was started from.
# Change directory to ~/Downloads and start mutt.
alias neomutt="cd ~/Downloads && /usr/bin/neomutt"

# Set keyboard repeat rate/delay
xset r rate 250 30

# Git aliases
alias gts="git status"
alias gta="git add"
alias gtc="git commit"
alias gtf="git fetch"
alias gtl="git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"

##
# grml-zsh-config
#
autoload -U colors && colors
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%{${fg[white]}%}[%{${fg[green]}%}%b%{${fg[yellow]}%}%m%u%c%{$reset_color%}%{${fg[white]}%}]%{$reset_color%} "

source /usr/bin/virtualenvwrapper.sh
function virtual_env_prompt () {
  REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}
grml_theme_add_token virtual-env -f virtual_env_prompt '%F{blue}' '%f'

zstyle ':prompt:grml:left:setup' items rc change-root path virtual-env vcs percent
