---
theme: uncover
class:
  - lead
  - invert
size: 16:9
footer: "Peter Fisher BSc MBCS howtocodewell.net @pfwd @howToCodeWell"
---

# Docker For WordPress Developers


---

# How many of you have heard of Docker?

--- 

# How many of you use Docker with WordPress?

---

# What | Why/When | How

---
# What is Docker?

---

![alt text](../src/assets/images/docker_was_born.jpg)

---
# Docker is a containerization technology

---
- A system is split into multiple containers
- Each container has a single responsibility
- Each container can be duplicated
---
# Docker has 3 parts

1) The client
2) The API
3) The Engine

---
# Docker Client

- Command line
- Desktop GUI
- Web based / other
---
# Docker API

Communication layer

---
# Docker Engine

The backend of Docker which handles all the Docker objects (networks/containers/images/volumes/etc)

---
### A Docker container is built from a Docker image

![bg right:50% width:80%](../src/assets/images/contains_eggs.jpg)

---
### A Docker image is made from many cached intermediate images

![bg right:50% width:80%](../src/assets/images/caching.jpg)

---
### A Dockerfile is a set of build instructions

![bg right:60% width:75%](../src/assets/images/instructions.jpg)

---
## Baking Docker containers is like baking cookies

![bg right:50% width:75%](../src/assets/images/baking.jpg)

---
# A Docker Image is the baked ingredients
![bg right:50% width:75%](../src/assets/images/cookies.jpg)

---
# A Dockerfile is the recipe
![bg right:50% width:75%](../src/assets/images/recipe.jpg)

---

# What is the difference between virtual machines and containers

---
![bg width:55%](../src/assets/images/containers_virtual_machines.jpg)

---
# Containerization != Virtualization

---
## Virtualization is like a house
![bg width:80% right:50%](../src/assets/images/simple_house_floor_plan.gif)

---
## Containerization is like a room
![bg width:80% right:40%](../src/assets/images/room.jpg)

---
# Different levels of abstraction

---
# Virtualization
- Custom environment
- Allocated resources
- Ecosystem

---
# Containerization
- Single process
- Single responsibilty
- Single purpose

---
# Docker can be used continuous integration

---
# How to use Docker with WordPress

---
## Docker Machine (Optional)
```
$ docker-machine create wordpress-install
$ docker-machine env wordpress-install
$ eval $(docker-machine env wordpress-install)
```
---
## Dockerfile
```dockerfile
FROM php:7.2.18-apache as builder-base
RUN apt-get update                                      && \
    apt-get install -y git zip mysql-client             && \
    docker-php-ext-install mysqli                       && \
    a2enmod rewrite                                     && \
    rm -rf /var/lib/apt/lists/*
ENV APACHE_DOCUMENT_ROOT /var/www/html/
ADD vhost.conf /etc/apache2/sites-available/000-default.conf

RUN curl -s https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www/html/
```

---
## Docker compose - structure
```yaml
version:

networks:

volumes:

services:

```

---
## Docker compose - Version
```yaml
version: '3.7'
```
---
## Docker compose - Network
```yaml
networks: 
    wordpress:
```
---
## Docker compose - Volumes
```yaml
volumes: 
    db-data:
```

---
## Docker compose - Services
```yaml
services: 

    apache2:
    
    mysql:
```

---
## Docker compose - PHP Apache
```yaml
  apache2:
    build:
      context: .
    env_file:
      - .env
    restart: always
    ports:
      - "80:80"
    volumes:
      - ./:/var/www/html
    networks:
      - wordpress
```

---
## Docker compose - MySQL
```yaml
  mysql:
    image: mysql:5.7
    env_file:
      - .env
    restart: always
    networks:
      - wordpress
    volumes:
      - db-data:/var/lib/mysql
```

---
## Build the Docker images and containers

```bash
$ docker-compose up -d --build
```
---
## Install WordPress
```bash
$ docker-compose exec apache2 composer install
```

---
## Create the wp-config file

```bash
$ docker-compose exec apache2 bash
$ ./vendor/bin/wp config create                     \
    --allow-root --dbname=${MYSQL_DATABASE}         \
    --dbuser=root --dbpass=${MYSQL_ROOT_PASSWORD}   \
    --dbhost=mysql
$ exit
```