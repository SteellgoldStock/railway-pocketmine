# Utilisation d'une image de base
FROM ubuntu:latest

# Mise à jour du système et installation des dépendances
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    bash

# Définition du répertoire de travail
WORKDIR /server

# Téléchargement de l'archive ZIP et extraction dans /server
RUN wget "https://pvcufspeowtzivzvgtkm.supabase.co/storage/v1/object/public/test/pm5.zip" \
    && unzip pm5.zip \
    && rm pm5.zip

# Téléchargement de start.sh
RUN wget "https://github.com/pmmp/PocketMine-MP/releases/download/5.1.2/start.sh"

# Définition des permissions de start.sh
RUN chmod +x ./start.sh

# Exécution de start.sh
CMD ["bash", "-c", "./start.sh"]
