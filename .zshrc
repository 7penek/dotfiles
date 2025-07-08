eval "$(/opt/homebrew/bin/brew shellenv)"

# === .hushlogin Setup ===
if [ ! -e "$HOME/.hushlogin" ]; then
    touch "$HOME/.hushlogin"
fi

if [[ $- == *i* ]]; then
    fastfetch -s "Title:Separator:OS:Kernel:Break:Colors:Break" --logo small

    # EXPORTS ############################################################

    export PS1="\[$(tput bold)$(tput setaf 9)\][\[$(tput setaf 11)\]\u\[$(tput setaf 10)\]@\[$(tput setaf 12)\]\h\[$(tput setaf 13)\] \W\[$(tput setaf 9)\]]\[$(tput setaf 15)\]\$\[$(tput sgr0)\] "
    export PS2="\[$(tput bold)$(tput setaf 11)\]>>\[$(tput sgr0)\] "

    unset HISTFILE
    export HISTFILE=/dev/null
    export HISTSIZE=0
    export SAVEHIST=0

    export GPG_TTY="$(tty)"
    export EDITOR="vim"
    export VISUAL="vim"
    export CODEEDITOR="vim"
    export PAGER="less"
    export LESSHISTFILE="-"

    # ALIASES ############################################################

    alias v='vim'
    alias c='cls'
    alias cc='cld'
    alias ..='cd ..'
    alias ls='lsd -hA --color=always'
    alias la='lsd -lhA --color=always'
    alias cat='bat --color=always --paging=always'
    alias cata='bat --color=always --paging=always --show-all'
    alias clearhst='history -c; clear'
    alias purgehst='rm -f "$HOME/.local/share/zsh/history"; history -c; clear'
    alias wasd='echo "==> UPDATING HOMEBREW"; brew update; echo "==> UPDATING HOMEBREW FORMULAES"; brew upgrade'
    alias wasdx='echo "==> AUTOREMOVING HOMEBREW PACKAGES"; brew autoremove; echo "==> PRUNING HOMEBREW PACKAGES"; brew cleanup --prune=all'

    # FALLBACKS ##########################################################
    
    alias ls_fallback='command ls'
    alias cat_fallback='command cat'

    # CLEAR FUNCTIONS ####################################################
    
    function cls() {
        if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
            clear
            git status -sb
            ls
        else
            clear
            ls
        fi
    }

    function cld() {
        cd "$@" && cls
    }

    # GIT FUNCTIONS ######################################################

    # Fully reset your working directory.
    function g0() {
        git reset --hard && git clean -fdx && cls
    }

    # Push changes.
    function gps() {
        git push "$@"
    }

    # Pull changes.
    function gpl() {
        git pull "$@"
    }

    # Commit changes.
    # If a commit message is provided, commit with -m.
    # If no message is provided, open the commit editor.
    function gcm() {
        if [ "$#" -gt 0 ]; then
            git commit -m "$*"
        else
            git commit -ev
        fi
    }

    # Checkout branches or commits.
    function gco() {
        git checkout "$@"
    }

    # Show remote repositories.
    function grm() {
        git remote -v "$@"
    }

    # Shortcut: Push changes (alias to gps).
    function gp() {
        gps "$@"
    }

    # Shortcut: Commit changes (alias to gcm).
    function gc() {
        gcm "$@"
    }

    # Shortcut: Show remotes (alias to grm).
    function gr() {
        grm "$@"
    }

    # Stage changes.
    function ga() {
        git add "$@"
    }

    # Fetch from remote.
    function gf() {
        git fetch "$@"
    }

    # List branches.
    function gb() {
        git branch "$@"
    }

    # Show the status in short format.
    function gs() {
        git status -sb "$@"
    }

    # Display concise, decorated log graph.
    function gl() {
        git log --graph --oneline --decorate "$@"
    }

    # Stage all changes and commit.
    function gg() {
        git add -A && gcm "$@"
    }

    # Stage all changes, commit, and push.
    function ggg() {
        git add -A && gcm "$@" && gp
    }

    # MISCELLANEOUS ######################################################

    # Remove trailing blank lines in the current directory.
    function rmblank() {
        # Loop through every file found (ignoring paths under .git).
        find . -type f -not -path '*/.git/*' -print0 | while IFS= read -r -d '' file; do
            # Use gsed to remove trailing blank lines.
            # Explanation of the sed command:
            # :a               - Creates a label 'a' for looping.
            # /^[[:space:]]*$/ - Checks if the line is empty or only whitespace.
            # {$d;N;ba;}       - Deletes the current empty line if at the end of the file,
            #                    appends the next line, and then jumps back to label 'a'.
            gsed -i ':a;/^[[:space:]]*$/{$d;N;ba;}' "$file"
        done
    }

fi
