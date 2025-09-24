#!/bin/bash

# Setup Project A - HTTPS SERVER
# Exit on error
set -e

# Update repository and upgrade packages
apt-get update && apt-get upgrade -y
# Install necessary packages
apt-get install nginx ufw certbot python3-certbot-nginx curl wget git openssh-server-y
# Restart SSH service
systemctl restart ssh
# Setup Firewall
ufw allow 'Nginx Full'
ufw allow OpenSSH
ufw --force enable
ufw status verbose 
# Setup Nginx
systemctl enable --now nginx
echo "Nginx status:$(systemctl is-active nginx)"
# Finish setup
echo "Setup completed. Please access http://$(hostname -I | awk '{print $1}') in your browser."
echo "To set up SSL, run: certbot --nginx -d your_domain.com -d www.your_domain.com"
echo "Nginx logs: /var/log/nginx/access.log | /var/log/nginx/error.log"