FROM debian:12

# Installer les dépendances et Node.js
RUN apt-get update -yq && \
    apt-get install -yq curl gnupg ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_20.x — Node.js 20 "Iron"  | bash && \
    apt-get install -yq nodejs && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Ajouter les fichiers de l'application
ADD . /app/
WORKDIR /app

# Installer les dépendances de l'application
RUN npm install --force

# Exposer le port et configurer les volumes
EXPOSE 2368
VOLUME /app/logs

# Commande pour démarrer l'application
CMD ["npm", "run", "start"]
