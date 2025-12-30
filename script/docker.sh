#!/bin/bash

# 1. Update packages and install Docker from default repo
sudo dnf update -y
sudo dnf install -y docker

# 2. Create the directory for Docker CLI plugins
sudo mkdir -p /usr/libexec/docker/cli-plugins

# 3. Download the latest Docker Compose binary
# This handles both x86_64 and aarch64 architectures automatically
sudo curl -SL "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m)" -o /usr/libexec/docker/cli-plugins/docker-compose

# 4. Apply executable permissions to the plugin
sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose

# 5. Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# 6. Add users to the docker group
sudo usermod -aG docker ec2-user
sudo usermod -aG docker jenkins

# 7. Create a symbolic link for 'docker-compose' compatibility
sudo ln -sf /usr/libexec/docker/cli-plugins/docker-compose /usr/local/bin/docker-compose

echo "Installation complete."
echo "Verify with: docker compose version OR docker-compose --version" "Installation complete. Please restart your Jenkins agent for group changes to take effect."