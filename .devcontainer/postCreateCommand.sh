#!/bin/bash


sh <(curl -sS https://starship.rs/install.sh) --yes
echo 'eval "$(starship init bash)"' >>~/.bashrc
apt-get update && apt-get install -y gh
