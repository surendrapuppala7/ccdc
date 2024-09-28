#!/bin/bash
# Script to configure firewall and disable unnecessary services

# Stop unnecessary services (add/remove services as needed)
sudo systemctl stop vsftpd
sudo systemctl stop apache2
sudo systemctl stop mysql

# Disable services from starting at boot (add/remove services as needed)
sudo systemctl disable vsftpd
sudo systemctl disable apache2
sudo systemctl disable mysql

# Install UFW if it's not installed
sudo apt-get install ufw -y

# Enable UFW
sudo ufw enable

# Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow only necessary ports
sudo ufw allow 80/tcp         # HTTP for Drupal, Payroll, Turtle websites
sudo ufw allow 21/tcp         # FTP services
sudo ufw allow 22/tcp         # SSH
sudo ufw allow 6697/tcp       # IRC
sudo ufw allow 3500/tcp       # Info website
sudo ufw allow 9200/tcp       # Elasticsearch
sudo ufw allow 3389/tcp       # RDP
sudo ufw allow 445/tcp        # SMB (File sharing)
sudo ufw allow 8585/tcp       # Blog website

# Restart networking services (if needed)
sudo systemctl restart networking

# Show firewall status
sudo ufw status
