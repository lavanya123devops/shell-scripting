#!/bin/bash

Head() {
  echo -e "\e[1;36m ============================ $1 ============================ \e[0m"
}

OS_PREREQ() {
  LOG=/tmp/${COMPONENT}.log
  rm -f $LOG
  set-hostname ${COMPONENT}
  Head " Updating APT Repos "
  apt update &>$LOG
}

ERROR() {
  echo -e "\e[1;31m$1\e[0m"
}

