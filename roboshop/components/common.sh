#!/bin/bash

OS_PREREQ() {
  LOG=/tmp/${COMPONENT}.log
  rm -f $LOG
  set-hostname ${COMPONENT}
  apt update &>$LOG
}

ERROR() {
  echo -e "\e[1;31m$1\e[0m"
}

