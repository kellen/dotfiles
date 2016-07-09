#
# DEFAULT section (ubuntu)
#

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#
# History
#

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# make a long-term bash history
HOSTNAME="$(hostname)" 
HOSTNAME_SHORT="${HOSTNAME%%.*}"
mkdir -p ${HOME}/.history/$(date -u +%Y/%m)
HISTSIZE=""
HISTFILESIZE=""
HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${HOSTNAME_SHORT}_$$"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# use extended globbing where, for example, exclusions work, e.g. !(README.md)
shopt -s extglob

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

source ~/.bash_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ~="cd ~"
alias -- -="cd -"       # cd $OLDPWD

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#
# CUSTOM section
#

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

# alias tmux to ensure we get 256 colors
alias tmux='TERM=xterm-256color tmux'

# show the thread count (nlwp column) for all processes
# nlwp = number of light-weight processes
alias threads='ps -eLo pid,nlwp,cmd | uniq'

# make ack use less as the pager, keeping colors
export ACK_PAGER="less -R"

# show the currently open ports
alias ports='sudo netstat -lp --numeric-ports'

# 256 fy fan
#[ -n "$TMUX" ] && export TERM=screen-256color
#export TERM=xterm-256color

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

#play wfmu
alias wfmu='mplayer -playlist "http://www.wfmu.org/wfmu.pls"'

export SVN_EDITOR=vi
export LC_CTYPE="en_US.UTF-8"

export SCALA_HOME=~/bin/scala
PATH="${PATH}":"${SCALA_HOME}/bin"

PATH="${PATH}":~/bin/nim/bin
