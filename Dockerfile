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
RUN wget "https://pvcufspeowtzivzvgtkm.supabase.co/storage/v1/object/public/test/pm5.zip"
RUN unzip pm5.zip

# Commande à exécuter au démarrage du conteneur
CMD ["bash", "-c", "ls"]
