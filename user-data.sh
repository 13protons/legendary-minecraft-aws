#!/bin/bash
set -e


# Install Docker, Docker Compose, and git
sudo apt-get update
sudo apt-get install -y docker.io git curl
sudo apt-get install -y docker-compose

# Enable and start Docker
systemctl enable docker
systemctl start docker

# Add ubuntu to docker group
usermod -aG docker ubuntu

# Prepare plugins and server files as root
cd /home/ubuntu
if [ ! -d legendary-minecraft-aws ]; then
  git clone https://github.com/13protons/legendary-minecraft-aws.git
fi
cd legendary-minecraft-aws
mkdir -p data/plugins
curl -L -o data/plugins/Geyser-Spigot.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot
curl -L -o data/plugins/Floodgate-Spigot.jar https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot
curl -L -o data/plugins/Viaversion.jar https://api.spiget.org/v2/resources/19254/download

# Start the server as root (cloud-init context)
docker-compose up -d

# Print status
docker ps -a