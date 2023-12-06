# My Project README

## Installation Script

```bash
#!/bin/bash

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Start Tailscale
sudo tailscale up --advertise-exit-node --accept-dns=true --ssh

# Install Pi-hole
curl -sSL https://install.pi-hole.net | bash

# Install Unbound
sudo apt install unbound -y

# Move pi-hole.conf file if it's in the same directory as the script
if [ -f "pi-hole.conf" ]; then
    sudo mv pi-hole.conf /etc/unbound/unbound.conf.d/
else
    echo "pi-hole.conf not found in the current directory. Please provide the correct path."
    # If the pi-hole.conf file is in a different directory, specify the correct path in the 'mv' command.
    # Example: sudo mv /path/to/pi-hole.conf /etc/unbound/unbound.conf.d/
fi

# Restart Unbound
sudo systemctl restart unbound
