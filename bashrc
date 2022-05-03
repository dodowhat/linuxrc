# ~/bashrc.d/bashrc

if command -v setxkbmap &> /dev/null; then
    setxkbmap -option "ctrl:nocaps"
fi

alias proxyon='export https_proxy=http://127.0.0.1:7890'
alias proxyoff='unset https_proxy'

export PATH=~/.local/bin:/sbin:$PATH

