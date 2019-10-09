#!/bin/sh


echo -n "Name of new-user for nfs: "
read username
echo $username


echo -n "Enter password:  "
read  password
echo $password


a=$(dnf list installed nfs-utils)

if ($a); then
	dnf install nfs-utils 
else 
	echo alrdy have package
fi
echo $a


adduser "$username"
echo "$password" | passwd "$username" --stdin

