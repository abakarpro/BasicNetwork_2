# Utilisation de l'image Node.js Alpine légère
FROM node:20-alpine

# Installer Python et make pour node-gyp
RUN apk add --no-cache python3 make g++

# Répertoire de travail dans le container
WORKDIR /app/api-2

# Copier package.json et installer les dépendances
COPY package*.json ./
RUN npm ci

# Copier le reste des fichiers de l'application
COPY . .

# Expose le port sur lequel l'application écoute
EXPOSE 4000

# Commande pour démarrer le serveur
CMD ["npm", "start"]