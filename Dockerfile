FROM node:18-bullseye-slim

# System-Tools und Python installieren
RUN apt-get update && \
    apt-get install -y python3 python3-pip curl gnupg && \
    apt-get clean

# n8n installieren
RUN npm install n8n -g

# n8n Datenverzeichnis
ENV N8N_USER_FOLDER="/home/node/.n8n"
ENV N8N_BASIC_AUTH_ACTIVE=true

# User anlegen und Verzeichnis setzen
RUN useradd --create-home --uid 1000 node
USER node
WORKDIR /home/node

# Startbefehl
CMD ["n8n"]
