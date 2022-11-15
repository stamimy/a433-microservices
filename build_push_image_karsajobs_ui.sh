#!/bin/bash

# Build image
docker build . -t stamimy/karsajobs-ui:latest

# Login ke GitHub Packages, pastikan Environment variable GITHUB_ACCESS_TOKEN ada 
# dan sudah diset dengan perintah: export GITHUB_ACCESS_TOKEN=<token-anda>
echo $GITHUB_ACCESS_TOKEN | docker login ghcr.io -u stamimy --password-stdin

# Format nama image agar kompatibel dengan GitHub Packages
docker tag stamimy/karsajobs-ui:latest ghcr.io/stamimy/karsajobs-ui:latest

# Publish ke GitHub Packages
docker push ghcr.io/stamimy/karsajobs-ui:latest