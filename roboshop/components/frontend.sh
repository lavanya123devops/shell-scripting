#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG

DOWNLOAD_COMPONENT

Head "Remove Default Configuration"
rm -rf /var/www/html /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

Head "Unzip Downloaded Archive"
cd /var/www
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static html
rm -rf frontend-main README.md

Head "Update Nginx Configuration"
mv roboshop.conf /etc/nginx/sites-enabled/roboshop.conf

Head "Restart Nginx Service"
systemctl restart nginx

