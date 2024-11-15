#!/bin/bash

echo "Updating system and installing Python..."
sudo apt update && sudo apt install python3 python3-pip -y

echo "Installing virtualenv..."
pip install -U virtualenv

echo "Installing Python venv module..."
sudo apt install python3.10-venv -y

echo "Creating virtual environment for JupyterHub..."
sudo python3 -m venv /opt/jupyterhub/

echo "Installing Python dependencies in the virtual environment..."
sudo /opt/jupyterhub/bin/python3 -m pip install wheel
sudo /opt/jupyterhub/bin/python3 -m pip install jupyterhub jupyterlab
sudo /opt/jupyterhub/bin/python3 -m pip install ipywidgets
sudo /opt/jupyterhub/bin/python3 -m pip install dockerspawner

echo "Installing Node.js and npm..."
sudo apt install nodejs npm -y

echo "Installing configurable-http-proxy..."
sudo npm install -g configurable-http-proxy

echo "Creating necessary directories for JupyterHub..."
sudo mkdir -p /opt/jupyterhub/etc/jupyterhub/
cd /opt/jupyterhub/etc/jupyterhub/

echo "Generating JupyterHub configuration file..."
sudo /opt/jupyterhub/bin/jupyterhub --generate-config

echo "Setting up systemd service for JupyterHub..."
sudo mkdir -p /opt/jupyterhub/etc/systemd
sudo ln -s /opt/jupyterhub/etc/systemd/jupyterhub.service /etc/systemd/system/jupyterhub.service
sudo systemctl daemon-reload
sudo systemctl enable jupyterhub.service

echo "Starting JupyterHub service..."
sudo systemctl start jupyterhub.service

echo "Checking JupyterHub service status..."
sudo systemctl status jupyterhub.service
