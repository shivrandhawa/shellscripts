#!/bin/sh


a=$(dnf list installed samba)

if ($a); then
	dnf install samba -y
else 
	echo alrdy have package
fi
echo $a
