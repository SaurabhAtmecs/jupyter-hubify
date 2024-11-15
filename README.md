# jupyter-hubify

Instructions along with Script for Jupyter hub setup on Virtual Machine 

## To make Script Executable

### Using `wget`

```bash
wget https://raw.githubusercontent.com/singh1203/jupyter-hubify/main/setup_jupyterhub.sh
chmod +x setup_jupyterhub.sh
./setup_jupyterhub.sh
```

### Using `curl`

```bash
curl -O https://raw.githubusercontent.com/<username>/<repo>/main/setup_jupyterhub.sh
chmod +x setup_jupyterhub.sh
./setup_jupyterhub.sh
```

- Replace the content of "/opt/jupyterhub/etc/systemd/jupyterhub.service" with "jupyterhub.bin" content
  `vi /opt/jupyterhub/etc/systemd/jupyterhub.service`
  