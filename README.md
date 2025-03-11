# Inception

## Project Overview

Inception is a containerized web application project designed to showcase the power of Docker and Docker Compose in orchestrating multiple services efficiently. The project sets up a comprehensive web stack, incorporating MariaDB, Nginx, WordPress, Redis, FTP, Adminer, and Portainer. This setup ensures a scalable, secure, and efficient environment, making it ideal for developers, DevOps engineers, and system administrators interested in modern web hosting and management solutions.

## Key Features

### MariaDB
A robust and reliable open-source relational database management system used for storing website data.

### Nginx
A high-performance web server and reverse proxy server that handles HTTP requests efficiently.

### WordPress
A widely-used content management system (CMS) for creating and managing websites effortlessly.

### Redis
An in-memory data structure store used as a caching mechanism to optimize database performance.

### FTP
A secure and reliable file transfer protocol for managing website files remotely.

### Adminer
A lightweight database management tool providing an intuitive web interface for managing MariaDB databases.

### Portainer
A powerful web-based Docker management UI that simplifies container orchestration and monitoring.

### Docker Compose
Simplifies the deployment of multiple containerized services, ensuring seamless communication and dependency management.

## Installation

### If you don't have Docker and Docker Compose installed on your machine:
```bash
$ apt install curl
$ sudo apt install docker.io
$ curl -O -J -L https://github.com/docker/compose/releases/download/v2.11.2/docker-compose-linux-x86_64
$ chmod +x docker-compose-linux-x86_64
$ sudo cp ./docker-compose-linux-x86_64 /usr/bin/docker-compose
```

### If you already have Docker and Docker Compose installed on your machine:
```bash
  git clone https://github.com/DivineSean/inception.git
```
```bash
  cd ./inception && sudo make
```

## Managing the Containers
- **Portainer:** Access the Portainer UI at `http://localhost:9000`
- **Adminer:** Manage databases through Adminer at `http://localhost:8080`
- **WordPress:** The website can be accessed at `http://localhost`
- **FTP:** Configure an FTP client to connect to `ftp://localhost`
- **Redis:** Used internally to cache and optimize performance.

## Conclusion
This project provides a fully containerized web hosting solution using Docker, suitable for learning, development, and production environments. By integrating essential web technologies and modern DevOps tools, Inception delivers a powerful and flexible framework for web application deployment.

Feel free to fork and contribute!
