FROM debian:bullseye

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y

RUN	apt-get install -y wget tar

RUN wget  https://github.com/portainer/portainer/releases/download/2.19.1/portainer-2.19.1-linux-amd64.tar.gz && \
tar -xvf portainer-2.19.1-linux-amd64.tar.gz && \
rm portainer-2.19.1-linux-amd64.tar.gz 

ENTRYPOINT [ "/portainer/portainer" ]