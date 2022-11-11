#!/bin/bash

# Build image
docker build -t item-app:v1 .

# Listing image yang ada di local
docker images

# Login ke GitHub Packages, pastikan Environment variable ACCESS_TOKEN ada 
# dan sudah diset dengan perintah: export ACCESS_TOKEN=<token-anda>
echo $ACCESS_TOKEN | docker login ghcr.io -u stamimy --password-stdin

# Format nama image agar kompatibel dengan GitHub Packages
docker tag item-app:v1 ghcr.io/stamimy/item-app:v1

# Publish ke GitHub Packages
docker push ghcr.io/stamimy/item-app:v1