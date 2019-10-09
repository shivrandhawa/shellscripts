#!/bin/bash

sed -i 's/security.*/security = user/g' /etc/samba/smb.conf

echo "
[NFSHARE]
    comment = Win32 Share
    path = /home/lab3FT
    public = yes
    writable = yes
    printable = no" >> /etc/samba/smb.conf








