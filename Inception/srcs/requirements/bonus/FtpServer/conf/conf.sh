#!/bin/bash
#Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
useradd $FTP_USER -d  /ftp &> /dev/null
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USER:$FTP_USER /ftp
chmod -R 777 /ftp

#chmod +x /etc/vsftpd/vsftpd.conf
echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

service vsftpd stop
/usr/sbin/vsftpd /etc/vsftpd.conf