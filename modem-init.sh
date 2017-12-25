#!/bin/bash

if [ "$AUTO_GPS" != "0" ]
then
  3gpictl --gpson
fi

