#!/bin/bash

Head() {
  echo -e "\e[1;36m ============================ $1  \e[0m"
  echo -e "\e[1;36m ============================ $1  \e[0m" >>$LOG
}

OS_PREREQ() {
  set-hostname ${COMPONENT}
  Head "Updating APT Repos"
  apt update &>>$LOG
}

ERROR() {
  echo -e "\e[1;31m$1\e[0m"
}

DOWNLOAD_COMPONENT() {
  Head "Downloading ${COMPONENT} Component"
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/zelar-soft-roboshop/${COMPONENT}/archive/main.zip"
}
