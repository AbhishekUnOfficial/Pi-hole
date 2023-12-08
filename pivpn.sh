# install Pi-hole
curl -sSL https://install.pi-hole.net | bash

# install unbound
sudo apt install unbound -y

# move unbound config
if [ -f "pi-hole.conf" ]; then
    sudo mv pi-hole.conf /etc/unbound/unbound.conf.d/
else
    echo "pi-hole.conf not found in the current directory. Please provide the correct path."
    # If the pi-hole.conf file is in a different directory, specify the correct path in the 'mv' command.
    # Example: sudo mv /path/to/pi-hole.conf /etc/unbound/unbound.conf.d/
fi

# restart unbound
sudo service unbound restart

# install pivpn
curl -L https://install.pivpn.io | bash
