#!/bin/sh

#
# initialize 3gpi module script
# 

POWER_PIN="17"
POWER_DIR="out"

RESET_PIN="27"
RESET_DIR="out"

STATUS_PIN="22"
STATUS_DIR="in"

EXPORT="/sys/class/gpio/export"

SETTING="/etc/default/3gpi-utils"

#
# Usage: export_gpio [GPIO_PIN]
#
export_gpio ()
{
    DIRECTION="/sys/class/gpio/gpio${1}/direction"

    if [ ! -e $DIRECTION ]
    then
        echo $1 > $EXPORT
    fi
}

#
# Usage: set_direction [GPIO_PIN] [DIRECTION]
#
set_direction ()
{
    DIRECTION="/sys/class/gpio/gpio${1}/direction"

    if [ ! -w $DIRECTION ]
    then
        echo "cannot access ${DIRECTION}"
        return 1
    fi
    
    echo $2 > $DIRECTION
}

#
# initialize 3gpi
#

if [ -e $SETTING ]
then
    . $SETTING
else
    exit 1
fi

if [ ! -w $EXPORT ]
then
    echo "cannot access ${EXPORT}"
    exit 1
fi

if ! (export_gpio $POWER_PIN &&
    export_gpio $RESET_PIN &&
    export_gpio $STATUS_PIN)
then
    echo "gpio export failure"
    exit 1
fi

sleep 1

if ! (set_direction $POWER_PIN $POWER_DIR &&
    set_direction $RESET_PIN $RESET_DIR &&
    set_direction $STATUS_PIN $STATUS_DIR)
then
    exit 1
fi

if [ $AUTO_ON -eq 1 ]
then
    if [ $(/usr/sbin/3gpictl --status) = "off" ]
    then
        /usr/sbin/3gpictl --poweron
    fi
    if [ $AUTO_GPS -eq 1 ]
    then
        /usr/sbin/3gpictl --gpson
    fi
fi

