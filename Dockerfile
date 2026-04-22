FROM n8nio/n8n:latest

# Setăm utilizatorul root pentru a putea face modificări
USER root

# Instalăm SQLite folosind apt-get (Debian/Ubuntu)
RUN apt-get update && apt-get install -y sqlite3 && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Ne întoarcem la utilizatorul node pentru securitate
USER node

# Setăm variabilele de mediu necesare
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV NODE_OPTIONS="--max-old-space-size=384"
ENV N8N_HOST=${RAILWAY_PUBLIC_DOMAIN}
ENV WEBHOOK_URL=https://${RAILWAY_PUBLIC_DOMAIN}

# Expunem portul pe care rulează aplicația
EXPOSE 5678

# Folosim comanda directă a executabilului
CMD ["/usr/local/bin/n8n", "start"]