#!/bin/sh
# Deploy script to run on the VM (assumes repository is cloned on VM)
set -e
echo "Pulling latest images and restarting services..."
docker compose pull || docker-compose pull
docker compose up -d --remove-orphans || docker-compose up -d --remove-orphans
echo "Deployment finished."
