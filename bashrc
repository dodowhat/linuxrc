# ~/bashrc.d/bashrc

if command -v setxkbmap &> /dev/null; then
    setxkbmap -option "ctrl:nocaps"
fi

alias proxy-on='export https_proxy=http://127.0.0.1:7890'
alias proxy-off='unset https_proxy'

