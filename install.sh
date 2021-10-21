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

case $1 in
    "bashrc.d")
        bashrc_src=$dir/bashrc.d
        bashrc_dst=~/.bashrc.d
        if [ ! -d $bashrc_dst ]; then
            mkdir $bashrc_dst
        fi

        printf "cleaning $bashrc_dst ... "
        rm $bashrc_dst/*
        printf "success\n"

        printf "creating symlink from $bashrc_src/* to $bashrc_dst/* ... "
        for rc in $bashrc_src/*; do
            if [ -f "$rc" ]; then
                ln -s $rc $bashrc_dst/
            fi
        done
        printf "success\n"
    ;;
    "i3")
        i3conf_src=$dir/i3.conf
        i3conf_dst=~/.config/i3/config

        printf "cleaning $i3conf_dst ... "
        rm $i3conf_dst
        printf "success\n"

        printf "creating symlink from $i3conf_src to $i3conf_dst ... "
        ln -s $i3conf_src $i3conf_dst
        printf "success\n"

        i3statusconf_src=$dir/i3status.conf
        i3statusconf_dst=~/.config/i3status/config
        if [ ! -f $i3statusconf_dst ]; then
            mkdir -p $(dirname $i3statusconf_dst)
        fi

        printf "cleaning $i3statusconf_dst ... "
        rm $i3statusconf_dst
        printf "success\n"

        printf "creating symlink from $i3statusconf_src to $i3statusconf_dst ... "
        ln -s $i3statusconf_src $i3statusconf_dst
        printf "success\n"
    ;;
    "xresources")
        xresources_src=$dir/xresources
        if [ "$2" = "4k" ]
        then
            xresources_dst=~/.xresources_4k
        else
            xresources_dst=~/.xresources
        fi

        printf "cleaning $xresources_dst ... "
        rm $xresources_dst
        printf "success\n"

        printf "creating symlink from $xresources_src to $xresources_dst ... "
        ln -s $xresources_src $xresources_dst
        printf "success\n"

        printf "applying $xresources_dst ... "
        xrdb $xresources_dst
        printf "success\n"
    ;;
    *)
        echo "usage: install.sh bashrc.d|i3|xresources"
    ;;
esac

