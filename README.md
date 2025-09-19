# DATABASES

This repository contains the necessary to set up the databases of Keyfairy

## Requirements

* [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Windows/Mac) or Docker Engine (Linux).
* `.env` file with environment variables.

##  Project structure

```bash
├── 📁 DATABASES/
│   ├── .env
│   ├── .gitignore
│   ├── docker-compose.yml
│   ├── init-mongo.js
│   └── init.sql
```

## Steps to run the project

### Create .env file, for example:

Edit the .example.env file with actual variables, and rename it to .env

### Create network

```bash
docker network create app-network
```

### Run the databases

```bash
docker compose up --build -d
```

### Check running containers in Docker Desktop / Docker Engine

```bash
docker ps
```

### Stop the service

```bash
docker compose down
```