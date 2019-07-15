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
