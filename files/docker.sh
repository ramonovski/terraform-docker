#!/usr/bin/env bash

# Docker installation from repository
{
	apt-get update;
	apt-get -y install apt-transport-https ca-certificates curl software-properties-common;
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -;
	apt-key fingerprint 0EBFCD88;
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable";
	apt-get update;
	apt-get -y install docker-ce;
}

# Docker installation from deb package
if ! [ -x "$(command -v docker)" ]; then
 	echo 'Downloading deb package...'
	#curl https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.06.0~ce-0~ubuntu_amd64.deb > docker.deb && dpkg -i docker.deb
	curl https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce_17.06.0~ce-0~debian_amd64.deb > docker.deb && dpkg -i docker.deb
fi

# Nginx setup
if [ -x "$(command -v docker)" ]; then
	curl https://raw.githubusercontent.com/ramonovski/terraform-docker/master/files/index.html > index.html
	docker run --name docker-nginx -p 80:80 -d -v $(pwd):/usr/share/nginx/html nginx
fi

