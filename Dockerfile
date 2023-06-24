# Utilisation d'une image de base
FROM ubuntu:latest

# Mise à jour du système et installation des dépendances
RUN apt-get update && apt-get install -y \
    wget \
    bash \
    coreutils \
    ca-certificates \
    curl \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    libssh2-1-dev \
    libzip-dev \
    make \
    openssl \
    unzip \
    zlib1g-dev \
    software-properties-common

# Définition du répertoire de travail
WORKDIR /server

# Téléchargement de l'archive ZIP et extraction dans /server
RUN wget -qO /tmp/pm5.zip "https://pvcufspeowtzivzvgtkm.supabase.co/storage/v1/object/public/test/pm5.zip?t=2023-06-24T17%3A15%3A12.326Z" \
    && unzip -q /tmp/pm5.zip -d /server \
    && rm /tmp/pm5.zip

# Commande à exécuter au démarrage du conteneur
CMD ["bash", "-c", "ls -d */"]
