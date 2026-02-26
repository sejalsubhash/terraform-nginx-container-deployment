#!/bin/bash
set -e

# Update system
apt update -y

# Install Docker
apt install docker.io -y

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Pull NGINX image
docker pull nginx

# Run NGINX container
docker run -d \
  --name nginx-container \
  -p 80:80 \
  --restart always \
  nginx

