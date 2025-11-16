#!/bin/bash
set -e

sudo apt update
sudo apt install -y docker.io docker-compose git
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu

cd /home/ubuntu
git clone https://github.com/13protons/legendary-minecraft-aws.git
cd legendary-minecraft-aws
docker compose up -d
