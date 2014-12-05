# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# do the same with MANPATH
if [ -d ~/man ]; then
    MANPATH=~/man${MANPATH:-:}
    export MANPATH
fi

# use vim, fy fan.
export EDITOR=vim

# show the thread count (nlwp column) for all processes
# nlwp = number of light-weight processes
alias threads='ps -eLo pid,nlwp,cmd | uniq'

# make ack use less as the pager, keeping colors
export ACK_PAGER="less -R"

# show the currently open ports
alias ports='sudo netstat -lp --numeric-ports'

# 256 fy fan
export TERM=xterm-256color

# pretty prety json on the command line
alias json='python -mjson.tool'

# maven defaults w/ more memory
export MAVEN_DEBUG_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000"
export MAVEN_OPTS="-Xms2048m -Xmx3072m -XX:-UseGCOverheadLimit"

# generate passwords
alias generate-password='date +%s | sha256sum | base64 | head -c 32 ; echo'

highlight_func() {
    grep --color -E "${2}|$" "${1}"
}
# highlight w/ grep
alias high=highlight_func

if hash xmodmap 2>/dev/null; then
    if [ -n "${DISPLAY+x}" ]; then
        xmodmap $HOME/.Xmodmap
    fi
fi
export SVN_EDITOR=vi
export LC_CTYPE="en_US.UTF-8"
