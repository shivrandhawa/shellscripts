#!/bin/sh

a=$(dnf list installed samba)

if ($a); then
	dnf install samba -y
else 
	echo alrdy have package
fi
echo $a

sed -i 's/security.*/security = user/g' /etc/samba/smb.conf

echo "
[NFSHARE]
    comment = Win32 Share
    path = /home/lab3FT
    public = yes
    writable = yes
    printable = no" >> /etc/samba/smb.conf
