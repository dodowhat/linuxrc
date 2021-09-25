#!/bin/bash

DIR=$(realpath $(dirname $0))

# BASHRC_SRC=$DIR/bashrc
I3CONF_SRC=$DIR/i3.conf
I3STATUSCONF_SRC=$DIR/i3status.conf
XRESOURCES_SRC=$DIR/Xresources

# BASHRC_DST=~/.bashrc
I3CONF_DST=~/.config/i3/config
I3STATUSCONF_DST=~/.config/i3status/config

if [ ! -f $I3STATUSCONF_DST ]
then
    mkdir -p $(dirname $I3STATUSCONF_DST)
fi

if [ "$1" = "4k" ]
then
    XRESOURCES_DST=~/.Xresources_4k
else
    XRESOURCES_DST=~/.Xresources
fi

echo $XRESOURCES_DST

# echo "Remove $BASHRC_DST"
# rm $BASHRC_DST
# echo "Link $BASHRC_SRC to $BASHRC_DST"
# ln -s $BASHRC_SRC $BASHRC_DST

echo "Remove $I3CONF_DST"
rm $I3CONF_DST
echo "Link $I3CONF_SRC to $I3CONF_DST"
ln -s $I3CONF_SRC $I3CONF_DST

echo "Remove $I3STATUSCONF_DST"
rm $I3STATUSCONF_DST
echo "Link $I3STATUSCONF_SRC to $I3STATUSCONF_DST"
ln -s $I3STATUSCONF_SRC $I3STATUSCONF_DST

echo "Remove $XRESOURCES_DST"
rm $XRESOURCES_DST
echo "Link $XRESOURCES_SRC to $XRESOURCES_DST"
ln -s $XRESOURCES_SRC $XRESOURCES_DST

echo "Apply $XRESOURCES_DST"
xrdb $XRESOURCES_DST

