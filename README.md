# 🚀 Laravel 12 Docker Environment

![Laravel](https://img.shields.io/badge/laravel-12-red)
![PHP](https://img.shields.io/badge/PHP-8.3-blue)
![Dockerized](https://img.shields.io/badge/docker-ready-blue?logo=docker)

A simple Docker-based development environment for Laravel 12, MySQL, and phpMyAdmin.

---

## ⚙️ Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Make](https://www.gnu.org/software/make/) (optional but recommended)

## 📦 What's Included

- **Laravel 12**
- **PHP 8.x**
- **MySQL 8.0**
- **phpMyAdmin** (port `8080`)
- **Docker Compose**



## 🛠️ Getting Started

### 1. Clone this repository

```bash
git clone https://github.com/aelmizeb/laravel.git
cd laravel
```

### 2. Edit your .env inside src/ once Laravel is installed. Example DB settings:

```bash
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=root
```

### 3. Start the environment

```bash
make up
```

This will start:
- **Laravel container (laravel_app)**
- **MySQL container (mysql)**
- **phpMyAdmin container (phpmyadmin)**

### 4. Install Laravel (if not already installed)

```bash
make install-laravel
```

This will install Laravel 12 in the src directory.

## 🌐 Access Your App
Laravel: http://localhost:8000

phpMyAdmin: http://localhost:8080

Login Credentials for phpMyAdmin:

Server: mysql

Username: root

Password: root


## 💡 Useful Commands

Command	Description
make destroy	Remove containers and volumes

| Command       |             | Description |
|:--------------|:-----------:|:------|
| make up       |             | Start all containers |
| make down     |             | Stop all containers |
| make build    |             | Build and start containers |
| make destroy  |             | Remove containers and volumes |
| make destroyall|            | Full cleanup: containers, volumes, images|
| make install-laravel  |     | Install Laravel |
| make serve    |             | Start Laravel dev server |
| make logs     |             | Show container logs |
| make shell-laravel  |       | Access Laravel container bash shell |

## 📁 Project Structure

```bash
.
├── docker-compose.yml
├── Makefile
├── php/                  # PHP Dockerfile directory
├── src/                  # Laravel app will be installed here
└── README.md
```

## 🧹 Clean & Rebuild (Optional)

If you want to start fresh:

```bash
make destroyall
make up
make install-laravel
```

