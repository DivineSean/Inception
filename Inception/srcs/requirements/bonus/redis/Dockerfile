# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y lsb-release curl gpg

# RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

# RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list

RUN apt-get install -y redis-server

COPY /conf/redis.conf /etc/

RUN chmod 777 /etc/redis.conf

EXPOSE 6379

# define the entrypoint command to run when the container starts
ENTRYPOINT [ "redis-server" , "/etc/redis.conf" ]