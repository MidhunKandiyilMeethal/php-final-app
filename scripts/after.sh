#!/bin/bash
# Fix GitHub folder issue
if ls /var/www/html/Midhun* 1>/dev/null 2>&1; then
  mv /var/www/html/Midhun*/* /var/www/html/ 2>/dev/null || true
  rm -rf /var/www/html/Midhun* 2>/dev/null || true
fi
chown -R apache:apache /var/www/html 2>/dev/null || chown -R www-data:www-data /var/www/html || true
systemctl start httpd || true
systemctl enable httpd || true
exit 0
