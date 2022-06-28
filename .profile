# Agzg's ~/.profile file.
# Use with caution or not at all.

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Personal additions start here.

if [ "$HOSTNAME" != "azam" ] && [ $((1 + $RANDOM % 10)) -gt 8 ] && [ ! -f $HOME/.hidezam ]; then
    echo "Consider changing your hostname to 'azam'?"
fi
# PS1="azam:\W\$ "
PATH="$PATH:$HOME/go/bin:/usr/local/go/bin"

alias backup=/backup files=/files
alias end="pkill chrome; shutdown -P 0"
alias ls=dir
alias ivy="rlwrap ivy"
alias pat="echo FIXME; echo FIXME | xsel"
alias python="rlwrap python3.10" py=python
alias obsidian="~/.local/bin/obsidian/obsidian" obs=obsidian

alias todo="emacs -nw $DOCUMENTS/todo.txt"
alias unread="emacs -nw $DOCUMENTS/unread.txt"
