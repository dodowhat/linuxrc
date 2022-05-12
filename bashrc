# ~/bashrc.d/bashrc

if command -v setxkbmap &> /dev/null; then
    if [ -n "$DISPLAY" ] && [ "$XDG_SESSION_TYPE" != "wayland" ]; then
        setxkbmap -option "ctrl:nocaps"
    fi
fi

alias proxyon='export https_proxy=http://127.0.0.1:7890'
alias proxyoff='unset https_proxy'

export PATH=~/PortableMine/bin:~/.local/bin:/sbin:$PATH

