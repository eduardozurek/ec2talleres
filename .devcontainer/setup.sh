# Paquetes Python
python3 -m pip install -r .devcontainer/python_libraries_requirements.txt
#!/bin/bash
set -e

echo "Actualizando paquetes..."
sudo apt update

echo "Instalando herramientas Linux..."
sudo apt install -y \
    time \
    linux-tools-common \
    linux-tools-generic

echo "Instalando dependencias Python..."
python3 -m pip install --upgrade pip
python3 -m pip install -r .devcontainer/python_libraries_requirements.txt

echo ""
echo "Diagnóstico del entorno:"
echo "Kernel: $(uname -r)"

if [ -f /proc/sys/kernel/perf_event_paranoid ]; then
    PERF_LEVEL=$(cat /proc/sys/kernel/perf_event_paranoid)
    echo "perf_event_paranoid=$PERF_LEVEL"

    if [ "$PERF_LEVEL" -ge 3 ]; then
        echo "ADVERTENCIA: perf está restringido en este entorno."
        echo "Se recomienda usar time, psutil o cProfile."
    else
        echo "perf debería estar disponible."
    fi
fi

echo "Configuración finalizada."
