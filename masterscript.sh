#!/bin/bash
echo -n "Name of new-user for nfs: "
read username
echo $username

echo -n "Enter password:  "
read  password
echo $password

adduser "$username"
echo "$password" | passwd "$username" --stdin

a=$(dnf list installed nfs-utils)
if ($a); then
	dnf install nfs-utils -y
else 
	echo alrdy have package
fi
echo $a

systemctl enable nfs-server.service
systemctl start nfs-server.service


cd /etc
echo "/home/$username 10.211.55.0/24(rw,no_root_squash)">>exports
systemctl stop nfs-server.service
systemctl start nfs-server.service
