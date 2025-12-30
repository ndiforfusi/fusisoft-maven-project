#!/bin/bash
sudo wget -O /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnf upgrade -y
sudo yum install java-21-amazon-corretto-devel -y
sudo dnf install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
