# Docker + Docker Compose Installation Script

## Overview
This script automates the installation of Docker and Docker Compose on Ubuntu. It installs the required dependencies, adds the official Docker repository, installs Docker Engine, and fetches the latest version of Docker Compose from GitHub.

## Prerequisites
- A machine running **Ubuntu** (tested on Ubuntu 20.04/22.04)
- Root or sudo privileges

## Installation Steps
1. **Download the script**:
   ```bash
   curl -O https://raw.githubusercontent.com/sumit-kumawat/docker-compose/main/install_docker.sh
   ```
2. **Make the script executable**:
   ```bash
   chmod +x install_docker.sh
   ```
3. **Run the script with sudo**:
   ```bash
   sudo bash install_docker.sh
   ```

## What This Script Does
- Installs necessary dependencies (`apt-transport-https`, `ca-certificates`, `curl`, `software-properties-common`).
- Adds the Docker official GPG key and repository.
- Installs Docker (`docker-ce`, `docker-ce-cli`, `containerd.io`).
- Starts and enables the Docker service.
- Fetches the latest Docker Compose release from GitHub.
- Grants Docker group permissions to the root user.

## Verify Installation
After the script runs, you can check the installed versions:
```bash
docker --version
```
```bash
docker-compose --version
```

## Troubleshooting
If you face any issues:
- Ensure your system is updated: `sudo apt update && sudo apt upgrade -y`
- Check Docker service status: `sudo systemctl status docker`
- Restart Docker if needed: `sudo systemctl restart docker`

## License
This script is open-source. You can modify and distribute it freely.

