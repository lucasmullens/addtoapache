#!/bin/bash

#check if root, prompt based on if terminal/gui
if (($EUID != 0)); then
  if [[ -t 1 ]]; then
    sudo "$0" "$@"
  else
    exec 1>output_file
    gksu "$0 $@"
  fi
  exit
fi

#copy files to bin
sudo cp ./bin/* /usr/local/bin/
