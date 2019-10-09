#!/bin/sh

systemctl stop smb.service
systemctl start smb.service

echo -n "name of user: "
read username
echo $username


echo -n "passwd must match nfs:  "
read  password



smbpasswd -a "$username"
echo "$password" | passwd "$username" --stdin
echo "$password"
