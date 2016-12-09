#!/bin/bash

if [ "$AUTO_OFF" != "0" ]
then
  3gpictl --poweroff
elif [ "$AUTO_RESET" != "0" ]
then
  3gpictl --reset
fi

