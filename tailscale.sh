#!/bin/bash

# Install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# start tailscale
sudo tailscale up --advertise-exit-node --accept-dns=true --ssh

# Install Pi-hole
curl -sSL https://install.pi-hole.net | bash

# Install unbound
sudo apt install unbound -y

# Move pi-hole.conf file
mv pi-hole.conf /etc/unbound/unbound.conf.d/
