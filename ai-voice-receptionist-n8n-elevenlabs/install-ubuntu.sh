#!/usr/bin/env bash
set -euo pipefail

# 1. Install Docker + Compose plugin on Ubuntu 24.04 / 22.04
if ! command -v docker >/dev/null 2>&1; then
  curl -fsSL https://get.docker.com | sh
fi

# 2. Configure 2GB swap to prevent OOM kills on 4GB VPS nodes
if [ ! -f /swapfile ]; then
  fallocate -l 2G /swapfile && chmod 600 /swapfile
  mkswap /swapfile && swapon /swapfile
  echo '/swapfile none swap sw 0 0' >> /etc/fstab
fi

# 3. Open only SSH, HTTP, and HTTPS in UFW
if command -v ufw >/dev/null 2>&1; then
  ufw allow 22/tcp && ufw allow 80/tcp && ufw allow 443/tcp
fi

# 4. Launch stack (place docker-compose.yml, .env, Caddyfile in /opt/voice_agent)
mkdir -p /opt/voice_agent && cd /opt/voice_agent
docker compose pull && docker compose up -d
docker compose ps
