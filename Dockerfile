# Utilisation de l'image PHP 7.4
FROM php:7.4-cli

# Répertoire de travail
WORKDIR /server/pocketmine

# Installation de dépendances
RUN apt-get update && apt-get install -y wget

# Téléchargement de PocketMine-MP
RUN wget -O PocketMine-MP.phar https://github.com/pmmp/PocketMine-MP/releases/download/5.1.2/PocketMine-MP.phar

# Copie du fichier de configuration
COPY server.properties .

# Attribution des permissions
RUN chmod +x PocketMine-MP.phar

# Exposition du port utilisé par PocketMine-MP (par défaut, le port 19132 pour Minecraft Bedrock Edition)
EXPOSE 19132/udp

# Commande à exécuter lors du démarrage du conteneur
CMD php -d variables_order=EGPCS -d memory_limit=256M PocketMine-MP.phar
