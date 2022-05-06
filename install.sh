#!/usr/bin/env bash

dirname() {
    # Usage: dirname "path"
    local tmp=${1:-.}

    [[ $tmp != *[!/]* ]] && {
        printf '/\n'
        return
    }

    tmp=${tmp%%"${tmp##*[!/]}"}

    [[ $tmp != */* ]] && {
        printf '.\n'
        return
    }

    tmp=${tmp%/*}
    tmp=${tmp%%"${tmp##*[!/]}"}

    printf '%s\n' "${tmp:-/}"
}

dir=$(dirname $(realpath $0))

install_i3() {
    i3conf_src=$dir/i3.conf
    i3conf_dst=~/.config/i3/config

    if [[ -f $i3conf_dst ]];then
        printf "cleaning $i3conf_dst ... "
        rm $i3conf_dst
        printf "success\n"
    fi

    printf "creating symlink from $i3conf_src to $i3conf_dst ... "
    ln -s $i3conf_src $i3conf_dst
    printf "success\n"

    i3statusconf_src=$dir/i3status.conf
    i3statusconf_dst=~/.config/i3status/config
    if [ ! -f $i3statusconf_dst ]; then
        mkdir -p $(dirname $i3statusconf_dst)
    fi

    if [[ -f $i3statusconf_dst ]];then
        printf "cleaning $i3statusconf_dst ... "
        rm $i3statusconf_dst
        printf "success\n"
    fi

    printf "creating symlink from $i3statusconf_src to $i3statusconf_dst ... "
    ln -s $i3statusconf_src $i3statusconf_dst
    printf "success\n"
}

install_xresources() {
    if [[ -n $1 ]] && [[ $1 == "4k" ]]; then
        xresources_src=${dir}/Xresources_4k
    else
        xresources_src=${dir}/.Xresources
    fi
    xresources_dst=~/.Xresources

    if [[ -f $xresources_dst ]];then
        printf "cleaning $xresources_dst ... "
        rm $xresources_dst
        printf "success\n"
    fi

    printf "creating symlink from $xresources_src to $xresources_dst ... "
    ln -s $xresources_src $xresources_dst
    printf "success\n"

    printf "applying $xresources_dst ... "
    xrdb $xresources_dst
    printf "success\n"
}

install_tmux() {
    tmux_src=$dir/tmux.conf
    tmux_dst=~/.tmux.conf

    if [[ -f $tmux_dst ]];then
        printf "cleaning $tmux_dst ... "
        rm $tmux_dst
        printf "success\n"
    fi

    printf "creating symlink from $tmux_src to $tmux_dst ... "
    ln -s $tmux_src $tmux_dst
    printf "success\n"
}

case $1 in
    "i3")
        install_i3
    ;;
    "xresources")
        install_xresources $2
    ;;
    "tmux")
        install_tmux
    ;;
    *)
        echo "usage: install.sh bashrc.d|i3|xresources|tmux"
    ;;
esac

