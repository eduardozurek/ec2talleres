#!/bin/bash

echo "=== Actualizando repositorios ==="
sudo apt update

echo "=== Instalando Linux Tools ==="
sudo apt install -y linux-tools-common linux-tools-generic

echo "=== Buscando perf ==="
PERF_PATH=$(dpkg -L linux-tools-6.8.0-139 2>/dev/null | grep '/perf$')

if [ -n "$PERF_PATH" ]; then
    echo "perf encontrado en:"
    echo "$PERF_PATH"

    echo "=== Configurando alias ==="

    # Evita agregar el alias varias veces
    if ! grep -q "alias perf=" ~/.bashrc; then
        echo "alias perf='$PERF_PATH'" >> ~/.bashrc
    fi
else
    echo "No se encontró perf en linux-tools-6.8.0-139"
fi

echo "=== Configurando perf_event_paranoid ==="
sudo sysctl -w kernel.perf_event_paranoid=-1

echo
echo "Instalación terminada."
echo "Ejecute:"
echo "source ~/.bashrc"
