# Docker Containerization & Microservices Guide

## 1. Overview
Docker is an open-source containerization platform that enables developers to package applications into standardized units called containers.

---

## 2. Key Concepts & Architecture
- **Image**: Read-only template with application code, runtime, libraries, and dependencies.
- **Container**: Lightweight, isolated runtime instance of a Docker image.
- **Dockerfile**: Text document containing instructions to assemble a Docker image.
- **Docker Compose**: Tool for defining and running multi-container Docker applications.

---

## 3. Essential Docker CLI Commands
```bash
# Build image from Dockerfile
docker build -t devops-app:v1 .

# List local images
docker images

# Run container in detached mode mapping port 5000
docker run -d -p 5000:5000 --name app-container devops-app:v1

# View running container logs
docker logs -f app-container

# Inspect container health & status
docker ps -a
docker inspect app-container

# Stop and remove container
docker stop app-container
docker rm app-container
```

---

## 4. Multi-Container Orchestration with Docker Compose
```bash
# Start all services defined in docker-compose.yml
docker-compose up -d

# Stop and remove containers, networks, and volumes
docker-compose down -v

# View combined service logs
docker-compose logs -f
```
