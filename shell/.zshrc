# Use Starship
eval "$(starship init zsh)"

# Editor
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# Save Command-Histories to File
mkdir -p ~/histories
alias htf="history > ~/histories/$(date +'%Y-%m-%d_%T')"

# Update Dotfiles
alias bbl="bombadil link"

# NeoVim Shortcuts
alias vim="nvim"
alias v="nvim ."

# Rust 
alias cb="cargo build"
alias cbr="cargo build --release"

# Others
alias h="cd ~"
alias la="ls -a"

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Ubuntu-Specific
alias yay="sudo apt-get update && sudo apt-get upgrade -y"

# Git
alias gitrc="GIT_EDITOR=true git rebase --continue"
