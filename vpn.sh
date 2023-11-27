#!/bin/bash

sudo apt update -y

# Install Docker Compose
sudo apt install docker-compose -y

# Install QR-Code encoder
sudo apt install qrencode -y

# Create directory for WireGuard in default path (/etc/wireguard)
sudo mkdir /root/wireguard

# Getting the IP address of the current computer
current_ip=$(hostname -I | awk '{print $1}')

# Creating a docker-compose.yaml file and adding an IP address
cat <<EOF > /root/wireguard/docker-compose.yaml
---
version: "2.1"
services:
  wireguard:
    image: linuxserver/wireguard:latest
    container_name: wireguard
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Amsterdam # time zone of the server
      - SERVERURL=$current_ip
      - SERVERPORT=51820 #port of the vpn
      - PEERS=8 #count of peers
      - INTERNAL_SUBNET=10.10.0.0 #subnet
      - ALLOWEDIPS=0.0.0.0/0
      - LOG_CONFS=true #optional
    volumes:
      - ./config:/config
      - /lib/modules:/lib/modules #optional
    ports:
      - 51820:51820/udp
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
    restart: unless-stopped
EOF

sudo docker-compose -f /root/wireguard/docker-compose.yaml up -d