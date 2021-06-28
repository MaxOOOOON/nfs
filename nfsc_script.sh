#!/bin/bash
sudo yum install autofs -y
sudo mkdir -p /mnt/nfs_share

sudo echo '/mnt/nfs_share -fstype=nfs,hard,intr,nodev,nosuid 192.168.50.10:/var/share_fold' >> /etc/auto.nfs
sudo sed -i '8i /-      auto.nfs' /etc/auto.master

sudo systemctl enable autofs.service
sudo systemctl start autofs.service