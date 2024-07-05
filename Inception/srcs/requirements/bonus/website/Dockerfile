# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# # install the required packages
RUN apt-get install -y nginx gettext

RUN  mkdir -p /var/www/html/website

COPY ./index.html /var/www/html/website

COPY ./conf/config /etc/nginx

COPY ./tools/script.sh /

RUN chmod +x script.sh

EXPOSE 80

ENTRYPOINT ["./script.sh"]