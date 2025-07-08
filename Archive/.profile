[[ -f $HOME/.bashrc ]] && source $HOME/.bashrc

# Exports
export GPG_TTY="$(tty)"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$HOME/.local/bin:$HOME/.config/emacs/bin:$HOME/.cargo/bin:$GEM_HOME/bin"
export EDITOR="vim"
export VISUAL="vim"
export CODEEDITOR="vim"
export TERM="alacritty"
export TERMINAL="alacritty"
export COLORTERM="truecolor"
export PAGER="less"
export LESSHISTFILE="-"
export BROWSER="firefox"

<<powers
# Start SSH-AGENT
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval "$(ssh-agent -s)"
    ssh-add "$HOME/.ssh/id_ed25519"
fi
powers

<<powerx
# Start X-SERVERS
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
powerx
