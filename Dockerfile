# Utilisation de l'image Node.js Alpine légère
FROM node:20-alpine

# Installer Python et make pour node-gyp
RUN apk add --no-cache python3 make g++

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier package.json et package-lock.json de l'API dans le conteneur
COPY api-2/package*.json ./api-2/

# Définir le répertoire de travail dans le conteneur pour l'API
WORKDIR /app/api-2

# Installer les dépendances de l'API
RUN npm ci

# Copier tout le reste des fichiers de l'API dans le conteneur
COPY api-2/ .

# Copier les fichiers de configuration des certificats depuis le répertoire artifacts
COPY artifacts/ /app/artifacts/

# Expose le port sur lequel l'application écoute
EXPOSE 4000
EXPOSE 7051
EXPOSE 9051
EXPOSE 7054
EXPOSE 8054
EXPOSE 5984

# Commande pour démarrer le serveur
CMD ["npm", "start"]
