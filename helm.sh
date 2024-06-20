#!/bin/bash

# Step 1: Download Helm's GPG signing key
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null

# Step 2: Install apt-transport-https if not already installed
sudo apt-get install apt-transport-https --yes

# Step 3: Add Helm's repository to apt sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

# Step 4: Update apt package index
sudo apt-get update

# Step 5: Install Helm
sudo apt-get install helm -y
