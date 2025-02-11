#!/bin/bash

# Detect the OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Unsupported OS"
    exit 1
fi

echo "Detected OS: $OS"

# Install dependencies based on OS
case "$OS" in
    ubuntu|debian)
        echo "Installing dependencies for Ubuntu/Debian..."
        apt update && apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg
        ;;
    rhel|centos|fedora)
        echo "Installing dependencies for RHEL/CentOS/Fedora..."
        yum install -y yum-utils device-mapper-persistent-data lvm2 curl
        ;;
    suse|opensuse)
        echo "Installing dependencies for SUSE/OpenSUSE..."
        zypper install -y curl ca-certificates
        ;;
    *)
        echo "Unsupported OS"
        exit 1
        ;;
esac

# Add Docker repository and install Docker
case "$OS" in
    ubuntu|debian)
        echo "Adding Docker repository for Ubuntu/Debian..."
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list
        apt update && apt install -y docker-ce docker-ce-cli containerd.io
        ;;
    rhel|centos|fedora)
        echo "Adding Docker repository for RHEL/CentOS/Fedora..."
        yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        yum install -y docker-ce docker-ce-cli containerd.io
        ;;
    suse|opensuse)
        echo "Adding Docker repository for SUSE/OpenSUSE..."
        zypper addrepo https://download.docker.com/linux/sles/docker-ce.repo
        zypper install -y docker-ce docker-ce-cli containerd.io
        ;;
esac

# Enable and start Docker service
echo "Enabling and starting Docker service..."
systemctl enable --now docker

# Install Docker Compose
echo "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d '"' -f 4)
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Verify installation
echo "Verifying Docker installation..."
docker --version
docker-compose --version

# Add user to Docker group
echo "Adding root user to Docker group..."
usermod -aG docker root
newgrp docker

echo "Docker and Docker Compose installation completed successfully!"
