#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Install Maven"
apt install maven -y &>>$LOG
Stat $?


Head "Adding RoboShop User"
id roboshop &>>$LOG
if [ $? -ne 0 ]; then
  useradd -m -s /bin/bash roboshop
  Stat $?
fi

DOWNLOAD_COMPONENT

Head "Extract Downloaded Archive"
cd /home/roboshop && rm -rf shipping && unzip -o /tmp/shipping.zip &>>$LOG && mv shipping-main shipping && cd /home/roboshop/shipping &&  mvn clean package  &>>$LOG && chown roboshop:roboshop /home/roboshop -R && mv target/shipping-1.0.jar shipping.jar  &>>$LOG
Stat $?

# mv /home/roboshop/shipping/systemd.service /etc/systemd/system/shipping.service
# systemctl daemon-reload
# systemctl start shipping
# systemctl enable shipping