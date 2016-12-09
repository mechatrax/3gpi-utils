#!/bin/bash

GPIO_PATH=/sys/class/gpio

#
# Usage: gpio_unexport [PIN]
#
gpio_unexport ()
{
  if [ -e ${GPIO_PATH}/gpio${1} ]
  then
    echo $1 > ${GPIO_PATH}/unexport
  fi
}

[ ! -z $POWER_PIN ] && gpio_unexport $POWER_PIN
[ ! -z $RESET_PIN ] && gpio_unexport $RESET_PIN
[ ! -z $RI_PIN ] && gpio_unexport $RI_PIN
[ ! -z $STATUS_PIN ] && gpio_unexport $STATUS_PIN

