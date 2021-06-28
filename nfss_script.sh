#!/bin/bash
sudo mkdir -p /var/share_fold/upload
sudo chown nfsnobody:nfsnobody /var/share_fold/
sudo chmod 755 /var/share_fold/
sudo systemctl enable nfs 
sudo systemctl start nfs 
sudo echo '/var/share_fold 192.168.50.0/24(rw,sync,no_root_squash,no_subtree_check)' > /etc/exports
sudo exportfs -a
cd /var/share_fold/upload
touch file1.txt file2.txt file3.txt
sudo yum install epel-release -y
sudo yum install --enablerepo="epel" ufw -y
sudo ufw --force enable
sudo ufw allow from 192.168.50.0/24 to any port nfs
sudo ufw allow from 192.168.50.0/24 to any port 20048
sudo ufw allow from 192.168.50.0/24 to any port 111

