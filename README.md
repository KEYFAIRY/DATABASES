# DATABASES

This repository contains the necessary to set up the databases of Keyfairy

## Requirements

* [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Windows/Mac) or Docker Engine (Linux).
* `.env` file with environment variables.

##  Project structure

```bash
├── 📁 DATABASES/
│   └── docker-compose.yml # .yml for running containers
│   └── init.sql           # Temporary file to set up the SQL database
```

## Steps to run the project

### Create .env file, for example:

```bash
MYSQL_ROOT_PASSWORD=YOUR_MYSQL_ROOT_PASSWORD
MYSQL_DATABASE=YOUR_MYSQL_DATABASE
MYSQL_USER=YOUR_MYSQL_USER
MYSQL_PASSWORD=YOUR_MYSQL_PASSWORD
MYSQL_PORT=YOUR_MYSQL_PORT
```

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