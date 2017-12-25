#!/bin/bash

if [ "$AUTO_ON" != "0" ]
then
  if [ $(3gpictl --status) != "on" ]
  then
    3gpictl --poweron
  fi
fi

