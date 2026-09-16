#!/bin/bash
yum install -y httpd php
systemctl stop httpd || true
rm -rf /var/www/html/*
cp -r /opt/codedeploy-agent/deployment-root/*/*/deployment-archive/* /var/www/html/ 2>/dev/null || cp -r * /var/www/html/ 2>/dev/null || true
chown -R apache:apache /var/www/html
systemctl start httpd
systemctl enable httpd
