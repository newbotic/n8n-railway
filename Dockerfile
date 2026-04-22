FROM n8nio/n8n:latest

ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production

EXPOSE 5678

# Comanda de start standard, așa cum e definită în imaginea oficială
CMD ["n8n", "start"]