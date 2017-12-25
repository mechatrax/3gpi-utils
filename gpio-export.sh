#!/bin/bash

GPIO_PATH=/sys/class/gpio

#
# Usage: gpio_export [PIN]
#
gpio_export ()
{
  if [ ! -e ${GPIO_PATH}/gpio${1} ]
  then
    echo $1 > ${GPIO_PATH}/export
  fi
}

#
# Usage: gpio_dir [PIN] {in|out}
#
gpio_dir ()
{
  if [ -e ${GPIO_PATH}/gpio${1}/direction ]
  then 
    echo $2 > ${GPIO_PATH}/gpio${1}/direction
  fi
}


[ ! -z $POWER_PIN ] && gpio_export $POWER_PIN
[ ! -z $RESET_PIN ] && gpio_export $RESET_PIN
[ ! -z $RI_PIN ] && gpio_export $RI_PIN
[ ! -z $STATUS_PIN ] && gpio_export $STATUS_PIN

sleep 1

[ ! -z $POWER_PIN ] && gpio_dir $POWER_PIN "out"
[ ! -z $RESET_PIN ] && gpio_dir $RESET_PIN "out"
[ ! -z $RI_PIN ] && gpio_dir $RI_PIN "in"
[ ! -z $STATUS_PIN ] && gpio_dir $STATUS_PIN "in"

