eval (/opt/homebrew/bin/brew shellenv)

# === .hushlogin Setup ===
if not test -e $HOME/.hushlogin
    touch $HOME/.hushlogin
end

if status is-interactive
    fastfetch -s Title:Separator:OS:Kernel:Break:Colors:Break --logo small

    # EXPORTS ############################################################

    set -x fish_greeting
    #set -x PS1 (set_color -o red)'['(set_color yellow)(whoami)(set_color green)'@'(set_color blue)(hostname)(set_color magenta)' '(prompt_pwd)(set_color red)']'(set_color white)'$ '(set_color normal)
    #set -x PS2 (set_color -o yellow)'>> '(set_color normal)
    set -x GPG_TTY (tty)
    set -x EDITOR 'vim'
    set -x VISUAL 'vim'
    set -x CODEEDITOR 'vim'
    set -x PAGER 'less'
    set -x LESSHISTFILE '-'

    # ALIASES ############################################################

    alias v='vim'
    alias c='cls'
    alias cc='cld'
    alias ..='cd ..'
    alias ls='lsd -hA --color=always'
    alias la='lsd -lhA --color=always'
    alias cat='bat --color=always --paging=always'
    alias cata='bat --color=always --paging=always --show-all'
    alias clearhst='history clear; clear'
    alias purgehst='rm -f $HOME/.local/share/fish/fish_history; history clear; clear'
    alias wasd='echo "==> UPDATING HOMEBREW"; brew update; echo "==> UPDATING HOMEBREW FORMULAES"; brew upgrade'
    alias wasdx='echo "==> AUTOREMOVING HOMEBREW PACKAGES"; brew autoremove; echo "==> PRUNING HOMEBREW PACKAGES"; brew cleanup --prune=all'

    # FALLBACKS ##########################################################

    alias ls_fallback='command ls'
    alias cat_fallback='command cat'

    # CLEAR FUNCTIONS ####################################################

    function cls
        if git rev-parse --is-inside-work-tree 2>/dev/null
            clear; git status -sb; ls
        else
            clear; ls
        end
    end

    function cld
        cd $argv; and cls
    end

    # GIT FUNCTIONS ######################################################

    # Fully reset your working directory.
    function g0
        git reset --hard; and git clean -fdx; and cls
    end

    # Push changes.
    function gps
        git push $argv
    end

    # Pull changes.
    function gpl
        git pull $argv
    end

    # Commit changes.
    # If a commit message is provided, commit with -m.
    # If no message is provided, open the commit editor.
    function gcm
        if test (count $argv) -gt 0
            git commit -m (string join " " $argv)
        else
            git commit -ev
        end
    end

    # Checkout branches or commits.
    function gco
        git checkout $argv
    end

    # Show remote repositories.
    function grm
        git remote -v $argv
    end

    # Shortcut: Push changes (alias to gps).
    function gp
        gps $argv
    end

    # Shortcut: Commit changes (alias to gcm).
    function gc
        gcm $argv
    end

    # Shortcut: Show remotes (alias to grm).
    function gr
        grm $argv
    end

    # Stage changes.
    function ga
        git add $argv
    end

    # Fetch from remote.
    function gf
        git fetch $argv
    end

    # List branches.
    function gb
        git branch $argv
    end

    # Show the status in short format.
    function gs
        git status -sb $argv
    end

    # Display concise, decorated log graph.
    function gl
        git log --graph --oneline --decorate $argv
    end

    # Stage all changes and commit.
    function gg
        git add -A; and gcm $argv
    end

    # Stage all changes, commit, and push.
    function ggg
        git add -A; and gcm $argv; and gp
    end

    # MISCELLANEOUS ######################################################

    # Remove trailing blank lines in the current directory.
    function rmblank
        # Loop through every file found (ignoring paths under .git).
        for file in (find . -type f -not -path '*/.git/*')
            # Use sed to remove trailing blank lines.
            # Explanation of the sed command:
            # :a               - Creates a label 'a' for looping.
            # /^[[:space:]]*$/ - Checks if the line is empty or only whitespace.
            # {$d;N;ba;}       - Deletes the current empty line ($d) if at the end of the file,
            #                    appends the next line (N), and then jumps back to label 'a' (ba).
            gsed -i ':a;/^[[:space:]]*$/{$d;N;ba;}' $file
        end
    end
end
