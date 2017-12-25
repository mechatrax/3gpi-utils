#!/bin/bash

if [ "$AUTO_OFF" != "0" ]
then
  3gpictl --poweroff
else
  if [ "$WAKE_ON_RING" != "0" ]
  then
    3gpictl --rienable
    3gpictl --riclear
  fi
  if [ "$AUTO_RESET" != "0" ]
  then
    3gpictl --reset
  fi
fi

