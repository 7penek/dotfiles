[[ $- != *i* ]] && return
neofetch

# Exports
export PS1="\[$(tput bold)$(tput setaf 9)\][\[$(tput setaf 11)\]\u\[$(tput setaf 10)\]@\[$(tput setaf 12)\]\h\[$(tput setaf 13)\] \W\[$(tput setaf 9)\]]\[$(tput setaf 15)\]\$\[$(tput sgr0)\] "
export PS2="\[$(tput bold)$(tput setaf 11)\]>>\[$(tput sgr0)\] "
export GPG_TTY="$(tty)"
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

# Aliases
alias v="vim"
alias c="cls"
alias cc="cld"
alias ..="cd .."
alias mv="mv -vi"
alias rm="rm -vi"
alias cp="cp -vi"
alias ln="ln -vi"
alias ls="lsd -hA --color=always"
alias la="lsd -lhA --color=always"
alias pip="pip3"
alias cat="batcat --color=always --paging=never"
alias catt="batcat --color=always --paging=never --show-all"
alias grep="grep --color=always"
alias python="python3"
alias spotdl="spotdl"
alias songdl="yt-dlp -x --audio-format mp3"
alias clearhst="history -c && clear"
alias purgehst="rm -vf $HOME/.bash_history && history -c && clear"
alias startnet="sudo systemctl start NetworkManager.service && echo 'Finishing the operation.....' && sleep 5s"
alias restartnet="sudo systemctl restart NetworkManager.service && echo 'Finishing the operation.....' && sleep 5s"
alias virtualnet="sudo virsh net-start default && echo 'Finishing the operation.....' && sleep 5s"
alias wasd="clear && echo '---------- UPDATE --------------------------------------------' && sudo apt update && echo '---------- UPGRADE -------------------------------------------' && sudo apt upgrade -y && echo '---------- AUTOREMOVE ----------------------------------------' && sudo apt autoremove -y && echo '---------- REBOOTING -----------------------------------------' && echo 'Rebooting the system.....' && sleep 5s && systemctl reboot"
alias ttyreconfigure="sudo dpkg-reconfigure console-setup"

# Functions
cls() {
    if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
        clear && git status && ls;
    else
        clear && ls;
    fi;
}
cld() { cd "$@" && cls; }
g0() { git reset --hard && git clean -fdx && clear && git status && ls; }
gg() { git add -A && git commit -m "$@"; }
