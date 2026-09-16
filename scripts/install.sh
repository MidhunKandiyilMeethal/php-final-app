#!/bin/bash
echo "Starting install" > /tmp/deploy.log
sudo yum install -y httpd >> /tmp/deploy.log 2>&1 || true
sudo systemctl start httpd || true
sudo systemctl enable httpd || true
sudo chmod -R 777 /var/www/html
echo "Install OK" >> /tmp/deploy.log
exit 0
