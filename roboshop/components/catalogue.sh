#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Install NPM"
apt install npm -y &>>$LOG
Stat $?

Head "Adding RoboShop User"
useradd -m -s /bin/bash roboshop
Stat $?


DOWNLOAD_COMPONENT

Head "Extracting Downloaded Archive"
cd /home/roboshop && unzip -o /tmp/catalogue.zip &>>$LOG && mv catalogue-main catalogue && cd /home/roboshop/catalogue && npm install &>>$LOG && chown roboshop:roboshop /home/roboshop -R 
Stat $?

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue