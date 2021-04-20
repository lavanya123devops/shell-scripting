#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Install Docker"
curl -s https://get.docker.com | bash  &>>$LOG
Stat $?

Head "Start Docker"
systemctl enable docker &>>$LOG  && systemctl start docker
Stat $?

Head "Start MySQL Service with Docker"
mkdir -p /data
docker ps | grep mysql -i &>>$LOG
if [ $? -ne 0 ]; then
  docker run -v /data:/var/lib/mysql --name mysql -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=password mysql:5.7.33 &>>$LOG
fi 
Stat $?

DOWNLOAD_COMPONENT

Head "Extract Downloaded Schema"
cd /tmp && unzip -o /tmp/mysql.zip &>>$LOG
Stat $?

Head "Load Schema"
cd mysql-main
IPADDR=$(hostname -i)
mysql -h ${IPADDR} -uroot -ppassword <shipping.sql &>>$LOG
Stat $?
