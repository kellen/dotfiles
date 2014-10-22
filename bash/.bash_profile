# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export EDITOR=vim

# show the thread count (nlwp column) for all processes
# nlwp = number of light-weight processes
alias threads='ps -eLo pid,nlwp,cmd | uniq'

# make ack use less as the pager, keeping colors
export ACK_PAGER="less -R"
