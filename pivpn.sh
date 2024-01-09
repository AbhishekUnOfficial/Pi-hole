# set timezone
sudo timedatectl set-timezone Asia/Kolkata

# install ufw
sudo apt install ufw -y && sudo ufw enable

# install Pi-hole
curl -sSL https://install.pi-hole.net | bash

# install unbound
sudo apt install unbound -y

# move unbound config
if [ -f "pi-hole.conf" ]; then
    sudo mv pi-hole.conf /etc/unbound/unbound.conf.d/
else
    echo "pi-hole.conf not found in the current directory."
fi

# restart unbound
sudo service unbound restart

# install pivpn
curl -L https://install.pivpn.io | bash
