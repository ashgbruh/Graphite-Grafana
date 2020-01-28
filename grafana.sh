#!/bin/bash 

sudo apt update
sudo apt upgrade -y
sudo apt-get install libfontconfig
wget https://dl.grafana.com/oss/release/grafana_5.4.3_amd64.deb
sudo dpkg -i grafana_5.4.3_amd64.deb
sudo systemctl enable --now grafana-server
