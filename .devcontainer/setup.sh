#!/bin/bash
set -e

# Herramientas Linux
sudo apt update
sudo apt install -y \
    time \
    linux-tools-common \
    linux-tools-generic

# Permitir acceso a contadores de rendimiento
sudo sysctl -w kernel.perf_event_paranoid=-1

# Configurar perf
sudo ln -sf \
    /usr/lib/linux-tools-6.8.0-139/perf \
    /usr/local/bin/perf

# Paquetes Python
python3 -m pip install -r .devcontainer/python_libraries_requirements.txt
