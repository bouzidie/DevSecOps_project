# Étape 1 : Utiliser une image Node.js comme base
FROM node:18-alpine

# Étape 2 : Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3 : Copier les fichiers de dépendances
COPY elmajni/package*.json ./

# Étape 4 : Installer les dépendances + installation de nodemon globalement
RUN npm install && npm install -g nodemon

# Étape 5 : Copier tout le reste du projet
COPY elmajni . 

# Étape 6 : Configurer les variables d'environnement pour MySQL
ENV DB_HOST=mysql
ENV DB_USER=root
ENV DB_PASSWORD=password
ENV DB_NAME=blogdb

# Étape 7 : Exposer le port utilisé par l'application
EXPOSE 3000

# Étape 8 : Lancer l'application avec nodemon
CMD ["nodemon", "./bin/www"]
