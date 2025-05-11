# ~/.bashrc - Clean and Optimized

# Source .info so extract file locations
source ~/.info

# Ensure this file is only executed in interactive shells
[[ $- != *i* ]] && return

# ====== Environment Variables ======
export EDITOR='/usr/bin/nvim' # Set Neovim as the default editor
export VISUAL='/usr/bin/nvim'
export PATH="$HOME/bin:$PATH" # Add custom scripts to PATH

# ====== Prompt Configuration ======
PS1='\W$ ' # Show only the current directory in the prompt

# ====== Terminal and Clipboard ======
alias copy='xclip -selection clipboard'
alias paste='xclip -o -selection clipboard'

# ====== Navigation Shortcuts ======
alias dotfiles='cd $HOME/.config/dotfiles && ls'
alias docs='cd $HOME/Documents && ls'
alias down='cd $HOME/Downloads && ls'
alias up='cd ..'

# ====== System Management ======
alias show='systemctl status'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias suspend='xfce4-session-logout --suspend'
alias logout='xfce4-session-logout --logout'

# ====== Package Management (Pacman) ======
alias pacman-update='sudo pacman -Syu --noconfirm && paccache -rk1'
alias updatepkglist='pacman -Qqetn > $HOME/.config/dotfiles/pkglist.txt'

# ====== Git Shortcuts ======
alias glog='git log --graph --oneline --all'
alias difft='git difftool'
alias ghowmany='git log --oneline | wc -l'

# ====== Tmux Shortcuts ======
alias attach='tmux attach -t'
alias tls='tmux list-sessions'
alias tkill='tmux kill-session -t'
alias tmux='tmux -2' # Force 256-color support in tmux

# ====== Network and IP Management ======
alias showdns='cat /etc/resolv.conf'
alias ip='ip -color=auto'
alias wifishow='nmcli device wifi list'
alias ipa='ip address'

dnschange() {
  echo 'nameserver 1.1.1.1' | sudo tee /etc/resolv.conf
}

disable6() {
  sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
  sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
}

enable6() {
  sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0
  sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0
}

# ====== Bluetooth Management ======
bluemanon() {
  sudo systemctl start bluetooth.service
  sudo bluetooth on
  blueman-manager
}

bluemanoff() {
  sudo bluetooth off
  sudo systemctl stop bluetooth.service
}

# ====== Display and Brightness ======
alias dull='redshift -P -O 4200'
alias bright='redshift -P -O 6500'

# ====== Battery Status ======
alias battery='sudo tlp-stat | grep Charge | head -1'

# ====== Terminal Enhancements ======
alias ls='lsd -lh --icon=never'
alias cat='bat'
alias grep='grep --color'
alias rg='rg -i'
alias screen='screenfetch -p'
alias colors='for C in {0..255}; do tput setab $C; echo -n "$C "; done; tput sgr0; echo'

# ====== Miscellaneous ======
alias open='xdg-open'
alias xx='xmodmap $HOME/.Xmodmap' # Apply custom Xmodmap keybindings
alias gui='startxfce4 && exit'
alias vim='nvim'
alias whoami='cowsay You are a hugeee butthole!!'
alias dc='droidcam'
alias sourcebash='source ~/.bashrc'
alias bashrc='nvim ~/.config/dotfiles/bashrc'

# ====== Fuzzy Finder (fzf) Integration ======
eval "$(fzf --bash)"

# ====== Node.js Version Manager (nvm) ======
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# ====== Apply Kitty Shell Integration ======
if [[ -n "$KITTY_INSTALLATION_DIR" && -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash" ]]; then
  source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
fi
