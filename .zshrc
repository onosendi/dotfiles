# Colorize pacman results.
alias pacman="pacman --color auto"

# Manage dotfiles.
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# By default Mutt will save attachments to the folder it was started from.
# Change directory to ~/Downloads and start mutt.
alias neomutt="cd ~/Downloads && /usr/bin/neomutt"

# Set keyboard repeat rate/delay
if [ $DISPLAY ]; then
    xset r rate 275 35
    xset m 0 0 # Turn off acceleration
fi

# Alias vim => nvim
alias vim="nvim"

# Fix terminal colors for gruvbox.
source "$HOME/.bin/gruvbox_256palette.sh"

##
# grml-zsh-config
#
autoload -U colors && colors
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%{${fg[cyan]}%}[%{$reset_color%}%{${fg_bold[red]}%}%b%{$reset_color%}%{${fg_bold[yellow]}%}%m%u%c%{$reset_color%}%{${fg[cyan]}%}]%{$reset_color%} "

source /usr/bin/virtualenvwrapper.sh
function virtual_env_prompt () {
  REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}
grml_theme_add_token virtual-env -f virtual_env_prompt '%F{white}' '%f'

zstyle ':prompt:grml:left:setup' items rc change-root virtual-env path vcs percent

# Use vi mode
bindkey -v

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git/'
