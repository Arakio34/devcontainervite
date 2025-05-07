FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Outils de base
RUN apt-get update && apt-get install -y \
    sudo curl wget git unzip zip tmux nano bash \
    build-essential software-properties-common \
    python3 python3-pip python3-venv \
    && apt-get clean

# Liens symboliques
RUN ln -sf /usr/bin/python3 /usr/bin/python && \
    [ -e /usr/bin/pip ] || ln -s /usr/bin/pip3 /usr/bin/pip


# Mise à jour pip + paquets standards
RUN pip install --upgrade pip && \
    pip install numpy scipy pandas matplotlib scikit-learn jupyterlab

# Installation de PyTorch via dépôt CPU officiel
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# TensorFlow (compatible CPU Ubuntu 22.04)
RUN pip install tensorflow==2.12.0

# Utilisateur non root
RUN useradd -ms /bin/bash devuser && echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER devuser
WORKDIR /home/devuser

CMD [ "bash" ]

