# Utilisation d'une image de base
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    bash

WORKDIR /server

RUN wget "https://pvcufspeowtzivzvgtkm.supabase.co/storage/v1/object/public/test/dossier.zip" \
    && unzip dossier.zip -d data \
    && rm dossier.zip

WORKDIR /server/data

RUN chmod +x ./start.sh

CMD ["bash", "-c", "./start.sh"]
