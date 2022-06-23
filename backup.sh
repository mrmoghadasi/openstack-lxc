#!/bin/bash

HOSTS=($(lxc-ls -f -F Name))

for HOST in "${HOSTS[@]}"
do
  if [[ $HOST == "NAME" ]]
  then
    continue
  fi
  echo -e "$HOST"
  lxc-stop $HOST
  tar -czPf "$HOST.tar.gz" "/var/lib/lxc/$HOST"
  lxc-start $HOST
done
