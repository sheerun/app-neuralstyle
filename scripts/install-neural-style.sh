#!/bin/bash

# Install loadcaffe
luarocks install loadcaffe
luarocks install image

# Install Neural Style
sudo mkdir -p /usr/local/neural-style
sudo chown -R nimbix:nimbix /usr/local/neural-style
cd /usr/local/neural-style
git clone https://github.com/jcjohnson/neural-style.git
cd /usr/local/neural-style/neural-style

# Download test models
/bin/bash models/download_models.sh
