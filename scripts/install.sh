#!/bin/bash
yum update -y
yum install -y httpd php
systemctl stop httpd || true
rm -rf /var/www/html/*
cp -r index.html /var/www/html/ 2>/dev/null || true
cp -r src /var/www/html/ 2>/dev/null || true
cp -r * /var/www/html/ 2>/dev/null || true
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html
systemctl start httpd
systemctl enable httpd
echo "OK" > /var/www/html/health.txt
