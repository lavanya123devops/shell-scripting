#!/bin/bash

source components/common.sh

Head "Setup MongoDB Repositories"
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - &>>$LOG && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.4.list
Stat $?

OS_PREREQ

Head "Install MongoDB"
apt install -y mongodb-org &>>$LOG
Stat $?

Head "Update MongoDB Listen IP Address"
sed -i -e "s/127.0.0.1/0.0.0.0/" /etc/mongod.conf
Stat $?

Head "Start MongoDB Service"
systemctl restart mongod && systemctl enable mongod &>>$LOG

DOWNLOAD_COMPONENT

Head "Extract Downloaded Archive"
cd /tmp && unzip mongodb.zip &>>$LOG && cd mongodb-main
Stat $?

Head "Load Schema into MongoDB"
for i in $(ls *.js); do
  echo "Loading $i"
  mongo <$i
  Stat $?
done

