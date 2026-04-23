FROM n8nio/n8n:latest

USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV NODE_OPTIONS="--max-old-space-size=384"

EXPOSE 5678

# Curăță datele vechi și asigură permisiunile corecte pentru volum
USER root
RUN rm -rf /home/node/.n8n
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

CMD ["n8n", "start"]