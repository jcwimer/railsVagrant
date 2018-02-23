#!/usr/bin/env bash

# Docker versions
COMPOSE_VERSION='1.15.0'
DOCKER_VERSION='17.06.2'

add-apt-repository ppa:ondrej/php -y
# Install docker key and repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update -qq
apt-get install -y -qq \
	software-properties-common \
	python-software-properties \
	curl \
	git \
	php7.1 \
	php7.1-common \
	php7.1-curl \
	php7.1-xml \
	php7.1-zip \
	php7.1-gd \
	php7.1-mysql \
	php7.1-mbstring \
	apache2-utils \
	libcurl4-openssl-dev \
	zlib1g-dev \
	python-dev \
	python-pip
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Install docker and compose
apt-get install -y -qq docker-ce=${DOCKER_VERSION}~ce-0~ubuntu
curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# Add ubuntu to docker group
usermod -a -G docker vagrant
