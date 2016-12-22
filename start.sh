#!/bin/bash

if [ "$AUTO_ON" != "0" ]
then

  if [ $(3gpictl --status) != "on" ]
  then
    3gpictl --poweron
  fi

  if [ "$AUTO_GPS" != "0" ]
  then
    sleep 10 && 3gpictl --gpson &
  fi

fi

