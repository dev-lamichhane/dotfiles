# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# source a secret bashrc file if present
[[ -f $HOME/.info ]] && source $HOME/.info

# source a temp bashrc file if present
[[ -f $HOME/.config/dotfiles/temp.bashrc ]] && source $HOME/.config/dotfiles/temp.bashrc

# exports
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#colors
r=$( tput setaf 160 )
g=$( tput setaf 34 )
b=$( tput setaf 21)
y=$( tput setaf 226 )
p=$( tput setaf 200 )
nc=$( tput sgr0)

# android studio bullshit
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/opt/android-studio/bin/

# java home
JAVA_HOME=$(dirname $( readlink -f $(which java) ))
JAVA_HOME=$(realpath "$JAVA_HOME"/../)
export JAVA_HOME

# prompt
PS1='\W$ '

# react native
alias rnstart='npx react-native start --reset-cache'
alias rnandroid='npx react-native run-android'
alias link='npx react-native link'
alias rn='npx react-native'
alias flipper='/home/dave/Downloads/Flipper/flipper'

# launch emulator
alias emulator='$HOME/Android/Sdk/emulator/emulator -avd Pixel_7_Pro_API_33'

# navigation & filesystem
alias bashrc='nvim $HOME/.config/dotfiles/bashrc'
alias vimrc='cd $HOME/.config/nvim/lua/dave'
alias tmuxrc='nvim $HOME/.config/dotfiles/tmux'
alias dotfiles='clear && cd $HOME/.config/dotfiles/ && ls'
alias snip='nvim $HOME/.config/nvim/snippets/'
alias docs='cd $HOME/Documents && ls'
alias down='cd $HOME/Downloads && ls'
alias aur='cd $HOME/AUR && ls'
alias dump='cd $HOME/Dump && ls'
alias jambo='nvim $HOME/Dump/jaambo/Jaambo-Frontend'
alias up='cd ..'
alias rmd='rm -rf'
create(){
  mkdir $1
  cd $1
  echo "$g You have created folder $r$PWD$g and you are inside it. Have Fun!!$nc"
}

# xclip
alias copy='xclip -i -selection clipboard <<<'
alias copyp='xclip -i -selection primary <<<'
alias copys='xclip -i -selection secondary <<<'
alias paste='xclip -o -selection clipboard'
alias pastep='xclip -o -selection primary'
alias pastes='xclip -o -selection secondary'
empty(){
  if [ $# -eq 0 ]; then
    echo -n "" | xclip -i -selection clipboard
  elif [ $1 = "c" ]; then
    echo -n "" | xclip -i -selection clipboard
  elif [ $1 = "p" ]; then
    echo -n "" | xclip -i -selection primary
  elif [ $1 = "s" ]; then
    echo -n "" | xclip -i -selection secondary
  elif [ $1 = "a" ]; then
    echo -n "" | xclip -i -selection clipboard
    echo -n "" | xclip -i -selection primary
    echo -n "" | xclip -i -selection secondary
  fi
}
reg(){
  if [ $# -eq 0 ]; then
    echo -e "clipboard: $(xclip -o -selection clipboard)"
    echo -e "primary: $(xclip -o -selection primary)"
    echo -e "secondary: $(xclip -o -selection secondary)"
  elif [ $1 = "c" ]; then
    echo -e "clipboard: $(xclip -o -selection clipboard)"
  elif [ $1 = "p" ]; then
    echo -e "primary: $(xclip -o -selection primary)"
  elif [ $1 = "s" ]; then
    echo -e "secondary: $(xclip -o -selection secondary)"
  else
    echo "invalid argument"
  fi
}

# systemctl & xfce
alias show='systemctl status'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias suspend='xfce4-session-logout --suspend'
alias logout='xfce4-session-logout --logout'


# pacman & package installation
alias pacmansyu='sudo pacman -Syu --noconfirm && updatepkglist && paccache -rk1'
alias updatepkglist='pacman -Qqetn > $HOME/.config/dotfiles/pkglist.txt'
yay(){
  cd $HOME/AUR/
  git clone "https://aur.archlinux.org/$1.git"
  cd $1
  makepkg -si
}

# git & github cli
alias glog='git log --graph --oneline --all'
alias difft='git difftool'
alias gcon='vim ~/.gitconfig'
alias ghowmany='git log --oneline | wc -l'
gsho(){
  if [ $# -eq 1 ]; then
    git show HEAD~$1
  else 
    git show HEAD~$1:$2
  fi
}

# tmux
alias attach='tmux attach -t'
alias tls='tmux list-sessions'
alias tkill='tmux kill-session -t'
alias tmux='tmux -2'
alias tclear='tmux kill-session -a'

# ncmli & network
alias showdns='cat /etc/resolv.conf'
alias ping='ping -c 5 1.1.1.1 && ping -c 5 8.8.8.8'
alias ip='ip -color=auto'
alias wifishow='nmcli device wifi list'
alias ipa='ip address'
alias wifi='nmcli | head -1'
alias vpn="sudo protonvpn"
connect(){
  # manually connect to a wifi
    if [ $# -eq 1 ]; then
        nmcli con up $1
    else
        nmcli device wifi connect $1 password $2
    fi
}

disable6(){
  # disable ipv6
    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
}

enable6(){
  # enable ipv6
    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0
    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0
}

dnschange(){
	sudo echo 'nameserver 1.1.1.1' > /etc/resolv.conf
}

# blueman 
bluemanon(){
	sudo systemctl start bluetooth.service
	sudo bluetooth on
	blueman-manager
}

bluemanoff(){
	sudo bluetooth off
	sudo systemctl stop bluetooth.service
}

# node & npm
alias tsn='ts-node'
node(){
    if [ $# -eq 0 ]; then
        /usr/bin/node $HOME/.config/dotfiles/noderc.js
    else
        /usr/bin/node $1
    fi
}
alias npmls='npm list -g --depth=0'

# redshift for brightness
alias dull='redshift -P -O 4200'
alias bright='redshift -P -O 6500'

# Youtube related 
alias tube='ytfzf -t'
alias radio='ytfzf -mt'
download(){
    if [ $# -eq 1 ]; then
      yt-dlp $1
    else
      yt-dlp --downloader ffmpeg --downloader-args "ffmpeg_i:-ss $2 -to $3" $1
    fi
}
downloadsong(){
  if [ $# -eq 1 ]; then
    yt-dlp -f 'ba' -x --audio-format mp3 $1  -o '%(id)s.%(ext)s'
  else 
    yt-dlp -f 'ba' -x --audio-format mp3 --downloader ffmpeg --downloader-args "ffmpeg_i:-ss $2 -to $3" -o '%(id)s.%(ext)s' $1 
  fi
}

# random
alias vim='nvim'
alias whoami='cowsay You are a hugeee butthole!!'
alias gui='startxfce4 && exit'
alias cat='bat'
alias ls='lsd -lh --icon=never'
alias less='less -r'
alias colors='for C in {0..255}; do tput setab $C; echo -n "$C "; done; tput sgr0; echo'
alias grep='grep --color'
alias rg='rg -i'
alias ssh='kitty +kitten ssh' #for some reason kitty misbehaves when ssh-ing, the developer provided this shortcut but idk what's going on
alias screen='screenfetch -p'
alias battery='sudo tlp-stat | grep Charge | head -1'
alias py='python'
alias pip='pip3'
alias open='xdg-open'
alias xx='xmodmap $HOME/.Xmodmap'


# run ncdu but skip messy shit
eyeball(){
  ncdu $1 --exclude node_modules --exclude-caches --exclude-kernfs --no-follow-symlinks
}

# pass calculations to bc
calc(){
    bc <<< "scale=10; $1"
}


# BEGIN_KITTY_SHELL_INTEGRATION
# idk what's going on ¯\_('_')_/¯

if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

