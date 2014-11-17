#!/bin/sh

#
# keep power script
# 

SETTING="/etc/default/3gpi-utils"

#
# check 3gpi status
#

if [ -e $SETTING ]
then
    . $SETTING
else
    exit 1
fi

if [ $AUTO_ON -eq 1 ] && [ $KEEP_ON -eq 1 ]
then
    if [ ! $(/usr/sbin/3gpictl --status) = "on" ]
    then
        /usr/sbin/3gpictl --poweron
    fi
fi

