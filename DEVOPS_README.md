DevOps Deployment Guide
======================

This document describes how to build, containerize, and deploy the MEAN stack application using Docker, Docker Compose, Nginx reverse-proxy, and GitHub Actions for CI/CD.

Overview
- Dockerfiles for frontend and backend are in `frontend/Dockerfile` and `backend/Dockerfile`.
- `docker-compose.yml` runs `mongo`, `backend`, `frontend`, and an Nginx reverse-proxy which exposes port 80.
- GitHub Actions workflow is in `.github/workflows/ci-cd.yml` and builds/pushes images to Docker Hub, then SSHes to the target VM and runs `./scripts/deploy.sh`.

Recommended flow
1. Create a GitHub repository and push this project to it.
2. Create a Docker Hub repository (or use your account) for two images: `crud-backend` and `crud-frontend`.
3. Create an Ubuntu VM (AWS/Azure/GCP). Install Docker and Docker Compose on the VM.
4. Clone the repository on the VM into a path such as `/home/ubuntu/app` and ensure `scripts/deploy.sh` is executable (`chmod +x scripts/deploy.sh`).
5. In GitHub repository settings, add the following secrets:
   - `DOCKERHUB_USERNAME` - your Docker Hub username
   - `DOCKERHUB_TOKEN` - a Docker Hub access token (recommended) or password
   - `SSH_HOST` - IP or hostname of your VM
   - `SSH_USER` - SSH user (e.g., `ubuntu`)
   - `SSH_PRIVATE_KEY` - Private key for SSH access (no passphrase) or use an action that supports password
   - `SSH_PORT` - optional SSH port (defaults to 22)
   - `REMOTE_APP_PATH` - path on VM where repo is cloned (e.g., `/home/ubuntu/app`)

Notes on MongoDB
- The default setup uses the official `mongo` container in `docker-compose.yml`. If you prefer installing MongoDB on the host VM, update `backend` service's `MONGO_URL` env to point to the host's MongoDB instance and remove the `mongo` service from compose.

How CI/CD works
- On push to `main` or `master`, the workflow builds the backend and frontend images and pushes them to Docker Hub under your account using the tags `crud-backend:latest` and `crud-frontend:latest`.
- After pushing images, the workflow SSHes to the VM and runs `./scripts/deploy.sh`, which pulls latest images and restarts the Docker Compose stack.

Local testing
- To test locally without CI:
  - Build images manually: `docker build -t myuser/crud-backend:dev ./backend` and `docker build -t myuser/crud-frontend:dev ./frontend`.
  - Start compose: `docker compose up -d --build` or `docker-compose up -d --build`.
  - Open `http://localhost` to see the frontend; backend API is available at `http://localhost/api/tutorials`.

Further steps before submission
- Add screenshots of your CI runs, Docker Hub pushes, and deployed app UI into the repo (place under `/screenshots`).
- Keep the VM/infra available (do not destroy) until interview/demonstration is complete.
