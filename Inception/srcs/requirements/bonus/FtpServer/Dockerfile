# Description: FTP Dockerfile

# pull the base image
FROM debian:bullseye

# update and upgrade the system
# RUN useradd markik -p minato123 -d /ftp -s /bin/bash -g root

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y vsftpd ftp lftp

RUN mkdir /ftp

# Set permissions for the ftp directory
RUN chmod 777 /ftp

COPY /tools/vsftpd.conf /etc/

RUN chmod 777 /etc/vsftpd.conf

COPY conf/conf.sh /

RUN chmod 777 conf.sh

# Expose FTP port
EXPOSE 20 21 21100-21110

WORKDIR /ftp
# Start vsftpd in the foreground
# ENTRYPOINT ["/usr/sbin/vsftpd","/etc/vsftpd.conf"]
CMD [ "./../conf.sh" ]