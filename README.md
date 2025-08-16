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
MYSQL_HOST=your_host
MYSQL_PORT=your_db_port
MYSQL_USER=your_db_user
MYSQL_PASSWORD=your_db_password
MYSQL_DB=your_db
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