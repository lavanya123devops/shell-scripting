#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Install NPM"
apt install npm -y &>>$LOG
Stat $?

Head "Adding RoboShop User"
id roboshop &>>$LOG
if [ $? -ne 0 ]; then
  useradd -m -s /bin/bash roboshop
  Stat $?
fi



DOWNLOAD_COMPONENT

Head "Extracting Downloaded Archive"
cd /home/roboshop && rm -rf user && unzip -o /tmp/user.zip &>>$LOG && mv user-main user && cd /home/roboshop/user && npm install &>>$LOG && chown roboshop:roboshop /home/roboshop -R
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/MONGO_DNSNAME/mongodb.zsdevops01.online/" -e "s/REDIS_ENDPOINT/redis.zsdevops01.online/" -e 's/MONGO_ENDPOINT/mongodb.zsdevops01.online/' /home/roboshop/user/systemd.service
Stat $?


Head "Setup SystemD Service"
mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service && systemctl daemon-reload && systemctl start user && systemctl enable user &>>$LOG
Stat $?
