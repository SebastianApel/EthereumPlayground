#!/bin/bash

sudo echo "Europe/Berlin" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

# Configure for fast Ubuntu mirrors
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

cat << EOF > /tmp/sources.list
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
EOF

sudo cp /tmp/sources.list /etc/apt/sources.list
#sudo apt-get update -y

# ALTERNATIVE - if mirrors does not work
cat << EOF > /tmp/sources.list
deb http://mirror.netcologne.de/ubuntu/ trusty main restricted universe multiverse
deb http://mirror.netcologne.de/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirror.netcologne.de/ubuntu/ trusty-backports main restricted universe multiverse
deb http://mirror.netcologne.de/ubuntu/ trusty-security main restricted universe multiverse
EOF
sudo cp /tmp/sources.list /etc/apt/sources.list
sudo apt-get update -y


#cd /vagrant
#mkdir app
#cd app

#wget https://raw.githubusercontent.com/ethereum/pyethapp/develop/Dockerfile




