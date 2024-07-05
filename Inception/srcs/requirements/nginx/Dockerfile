# Description: Nginx Dockerfile

# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# # install the required packages
RUN apt-get install -y nginx openssl

#install envsubst
RUN apt-get install -y gettext

RUN apt-get install -y netcat

# create the ssl directory
RUN mkdir -p /etc/nginx/ssl

# generate the ssl certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key -subj "/C=MO/ST=KH/L=KH/O=42/OU=42/CN=markik.42.fr/UID=markik"

# copy the nginx configuration file
COPY conf/config /etc/nginx

COPY /tools/script.sh /

RUN chmod +x script.sh

# create the wordpress directory
RUN mkdir -p /var/www/wordpress

# change the owner of the wordpress directory to www-data
RUN chown -R www-data:www-data /var/www/wordpress

# define the command to run when the container starts
ENTRYPOINT ["./script.sh"]
# CMD ["nginx", "-g", "daemon off;"]