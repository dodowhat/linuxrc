#!/bin/bash

dir=$(realpath $(dirname $0))

if [ "$1" = "bashrc.d" ]
then
    bashrc_src=$dir/bashrc.d
    bashrc_dst=~/.bashrc.d
    if [ ! -d $bashrc_dst ]; then
        mkdir $bashrc_dst
    fi
    echo "cleaning $bashrc_dst ..."
    rm $bashrc_dst/*
    echo "linking $bashrc_src/* to $bashrc_dst/* ..."
    for rc in $bashrc_src/*; do
        if [ -f "$rc" ]; then
            ln -s $rc $bashrc_dst/
        fi
    done
fi

if [ "$1" = "i3" ]
then
    i3conf_src=$dir/i3.conf
    i3conf_dst=~/.config/i3/config
    echo "cleaning $i3conf_dst ..."
    rm $i3conf_dst
    echo "linking $i3conf_src to $i3conf_dst ..."
    ln -s $i3conf_src $i3conf_dst

    i3statusconf_src=$dir/i3status.conf
    i3statusconf_dst=~/.config/i3status/config
    if [ ! -f $i3statusconf_dst ]
    then
        mkdir -p $(dirname $i3statusconf_dst)
    fi
    echo "cleaning $i3statusconf_dst ..."
    rm $i3statusconf_dst
    echo "linking $i3statusconf_src to $i3statusconf_dst ..."
    ln -s $i3statusconf_src $i3statusconf_dst
fi

if [ "$1" = "xresources" ]
then
    xresources_src=$dir/xresources
    if [ "$2" = "4k" ]
    then
        xresources_dst=~/.xresources_4k
    else
        xresources_dst=~/.xresources
    fi
    echo "cleaning $xresources_dst ..."
    rm $xresources_dst
    echo "linking $xresources_src to $xresources_dst ..."
    ln -s $xresources_src $xresources_dst
    echo "applying $xresources_dst ..."
    xrdb $xresources_dst
fi

