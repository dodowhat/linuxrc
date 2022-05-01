# ~/bashrc.d/bashrc

if command -v setxkbmap &> /dev/null; then
    setxkbmap -option "ctrl:nocaps"
fi

git_branch() {
    local GIT_BRANCH=$(git branch 2> /dev/null | grep '^*')
    if [[ "$GIT_BRANCH" == "" ]]; then
        echo $GIT_BRANCH;
    else
        echo "($GIT_BRANCH)";
    fi
}

alias proxy-on='export https_proxy=http://127.0.0.1:7890'
alias proxy-off='unset https_proxy'

