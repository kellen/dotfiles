if hash xmodmap 2>/dev/null; then
    if [ -n "${DISPLAY+x}" ]; then
        setxkbmap -model pc105 -layout us -variant altgr-intl
        xmodmap $HOME/.Xmodmap
    fi
fi
# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
