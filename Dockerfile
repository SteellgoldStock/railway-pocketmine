# Utilisation d'une image de base
FROM ubuntu:latest

# Mise à jour du système et installation des dépendances
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    bash

# Définition du répertoire de travail
WORKDIR /server

# Téléchargement de l'archive ZIP et extraction dans /server/data
RUN wget "https://pvcufspeowtzivzvgtkm.supabase.co/storage/v1/object/public/test/pm5.zip" \
    && unzip pm5.zip -d data \
    && rm pm5.zip

# Suppression du dossier "bin" existant dans /server/data
RUN rm -rf data/bin

# Téléchargement de PHP-Linux-x86_64-PM5.tar.gz et extraction dans /server/data/bin
RUN wget -O /tmp/PHP-Linux-x86_64-PM5.tar.gz "https://github.com/pmmp/PHP-Binaries/releases/download/php-8.1-latest/PHP-Linux-x86_64-PM5.tar.gz" \
    && tar -xzf /tmp/PHP-Linux-x86_64-PM5.tar.gz -C data \
    && rm /tmp/PHP-Linux-x86_64-PM5.tar.gz

# Définition du répertoire de travail dans /server/data
WORKDIR /server/data

# Liste des dossiers et fichiers du répertoire courant
RUN ls -la

# Téléchargement de start.sh
RUN wget "https://github.com/pmmp/PocketMine-MP/releases/download/5.1.2/start.sh"

# Donner les permissions d'exécution à start.sh
RUN chmod +x start.sh

# Liste des dossiers et fichiers du répertoire courant
RUN ls -la

# Exécution de start.sh
CMD ["bash", "-c", "ls -la && ./start.sh"]
