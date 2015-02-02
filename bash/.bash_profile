if hash xmodmap 2>/dev/null; then
    if [ -n "${DISPLAY+x}" ]; then
        xmodmap $HOME/.Xmodmap
    fi
fi
# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
