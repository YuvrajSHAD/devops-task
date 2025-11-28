# DevOps CRUD Task – Docker + CI/CD

This repository contains a simple CRUD application with separate backend and frontend services, fronted by Nginx and orchestrated using Docker Compose. It also includes a GitHub Actions workflow that builds/pushes images to Docker Hub and deploys to a remote Docker host over SSH.

---

## 1. Tech Stack

- Backend: Node.js / Express CRUD API (Dockerized)
- Frontend: React-based SPA (Dockerized)
- Reverse proxy: Nginx, routing HTTP traffic to frontend and backend
- Orchestration: Docker Compose
- CI/CD: GitHub Actions + Docker Hub + remote host (Kali WSL2 or any Linux server with Docker)

---

## 2. Repository Structure

- `backend/` – Backend application source and Dockerfile  
- `frontend/` – Frontend application source and Dockerfile  
- `nginx/` – Nginx configuration and Dockerfile  
- `docker-compose.yml` – Defines services (frontend, backend, nginx, etc.)  
- `.github/workflows/ci-cd.yml` – CI/CD pipeline definition  
- `scripts/` (if present) – Helper scripts used during deployment  

---

## 3. How to Replicate in an Linux Environment ( Need Public Access)

Follow these steps to run the full stack locally on a machine with Docker and Docker Compose installed.

1. Clone the repository and create your own repo
2. Have a docker hub accounts
3. And any cloud service like aws, digitalocean
4. Then Add the Secrets
><img width="804" height="681" alt="image" src="https://github.com/user-attachments/assets/c6b924f6-644b-47ed-a17a-7c95122012e6" />
```
1. TOKEN from docker hub
2. Docker hub username
3. Remote_PATH is where the repo is cloned on the VM ( we need it at only first, so this way github actions won't clone repo in loop)
4. SSH_HOST = IP
5. SSH_PORT = port where we can access the VM
6. SSH_PRIVATE_KEY = so that github action can access the VM and run the script to deploy (create a sshkey and add the public to authorized and copy the private and add in secrets not environmental variables)
7. SSH_USER = username of VM
```
### 4. This is it, Now i dont have an Cloud Service Plan or free tier credits.
### Same Can be achieved on local network for testing.
UI
><img width="1591" height="390" alt="image" src="https://github.com/user-attachments/assets/d4e0b828-4c7f-4e01-8f28-50f2aa292fea" />
><img width="1616" height="625" alt="image" src="https://github.com/user-attachments/assets/d4a84203-3b00-46ac-a731-015cfa4d17e3" />

```shell
Tree Structure
├── backend
│   ├── app
│   │   ├── config
│   │   │   └── db.config.js
│   │   ├── controllers
│   │   │   └── tutorial.controller.js
│   │   ├── models
│   │   │   ├── index.js
│   │   │   └── tutorial.model.js
│   │   └── routes
│   │       └── turorial.routes.js
│   ├── Dockerfile
│   ├── .gitignore
│   ├── package.json
│   └── server.js
├── DEVOPS_README.md
├── docker-compose.yml
├── frontend
│   ├── angular.json
│   ├── Dockerfile
│   ├── .editorconfig
│   ├── .gitignore
│   ├── nginx
│   │   └── nginx-frontend.conf
│   ├── package.json
│   ├── package-lock.json
│   ├── src
│   │   ├── app
│   │   │   ├── app.component.css
│   │   │   ├── app.component.html
│   │   │   ├── app.component.spec.ts
│   │   │   ├── app.component.ts
│   │   │   ├── app.module.ts
│   │   │   ├── app-routing.module.ts
│   │   │   ├── components
│   │   │   │   ├── add-tutorial
│   │   │   │   │   ├── add-tutorial.component.css
│   │   │   │   │   ├── add-tutorial.component.html
│   │   │   │   │   ├── add-tutorial.component.spec.ts
│   │   │   │   │   └── add-tutorial.component.ts
│   │   │   │   ├── tutorial-details
│   │   │   │   │   ├── tutorial-details.component.css
│   │   │   │   │   ├── tutorial-details.component.html
│   │   │   │   │   ├── tutorial-details.component.spec.ts
│   │   │   │   │   └── tutorial-details.component.ts
│   │   │   │   └── tutorials-list
│   │   │   │       ├── tutorials-list.component.css
│   │   │   │       ├── tutorials-list.component.html
│   │   │   │       ├── tutorials-list.component.spec.ts
│   │   │   │       └── tutorials-list.component.ts
│   │   │   ├── models
│   │   │   │   ├── tutorial.model.spec.ts
│   │   │   │   └── tutorial.model.ts
│   │   │   └── services
│   │   │       ├── tutorial.service.spec.ts
│   │   │       └── tutorial.service.ts
│   │   ├── assets
│   │   │   └── .gitkeep
│   │   ├── favicon.ico
│   │   ├── index.html
│   │   ├── main.ts
│   │   └── styles.css
│   ├── tsconfig.app.json
│   ├── tsconfig.json
│   └── tsconfig.spec.json
├── .git
│   ├── config
│   ├── description
│   ├── HEAD
│   ├── hooks
│   │   ├── applypatch-msg.sample
│   │   ├── commit-msg.sample
│   │   ├── fsmonitor-watchman.sample
│   │   ├── post-update.sample
│   │   ├── pre-applypatch.sample
│   │   ├── pre-commit.sample
│   │   ├── pre-merge-commit.sample
│   │   ├── prepare-commit-msg.sample
│   │   ├── pre-push.sample
│   │   ├── pre-rebase.sample
│   │   ├── pre-receive.sample
│   │   ├── push-to-checkout.sample
│   │   ├── sendemail-validate.sample
│   │   └── update.sample
│   ├── index
│   ├── info
│   │   └── exclude
│   ├── logs
│   │   ├── HEAD
│   │   └── refs
│   │       ├── heads
│   │       │   └── main
│   │       └── remotes
│   │           └── origin
│   │               └── HEAD
│   ├── objects
│   │   ├── info
│   │   └── pack
│   │       ├── pack-6e0ff2e0cea63065392739991a722cb3bca797f4.idx
│   │       ├── pack-6e0ff2e0cea63065392739991a722cb3bca797f4.pack
│   │       └── pack-6e0ff2e0cea63065392739991a722cb3bca797f4.rev
│   ├── packed-refs
│   └── refs
│       ├── heads
│       │   └── main
│       ├── remotes
│       │   └── origin
│       │       └── HEAD
│       └── tags
├── .github
│   └── workflows
│       └── ci-cd.yml
├── nginx
│   └── default.conf
├── README.md
└── scripts
    └── deploy.sh
```
