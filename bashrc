# bashrc

export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]: \[$(tput sgr0)\]"

alias cfw='~/Portable/cfw/cfw > /dev/null 2>&1 & disown'
alias proxyon='export https_proxy=http://127.0.0.1:7890'
alias proxyoff='unset https_proxy'
