# Docker + Docker Compose Installation Script

## Overview
This script automates the installation of Docker and Docker Compose on various Linux distributions, including:

- Ubuntu/Debian
- RHEL/CentOS/Fedora
- SUSE/OpenSUSE

## Prerequisites
- A supported Linux distribution (Ubuntu, Debian, RHEL, CentOS, Fedora, SUSE, OpenSUSE)
- Root or sudo privileges
- Internet access to download the necessary packages

## Installation Steps
**Download the script**:
   ```bash
   curl -O https://raw.githubusercontent.com/sumit-kumawat/docker-compose/main/install_docker.sh
   chmod +x install_docker.sh
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
docker-compose --version
```

## Troubleshooting
If you face any issues:

- Ensure your system is updated: sudo apt update && sudo apt upgrade -y (for Ubuntu/Debian) or yum update -y (for RHEL/CentOS/Fedora) or zypper update -y (for SUSE/OpenSUSE)
- Check Docker service status: sudo systemctl status docker
- Restart Docker if needed: sudo systemctl restart docker

## License
This script is open-source. You can modify and distribute it freely.

