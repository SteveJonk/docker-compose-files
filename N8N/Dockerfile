# Start with the n8n base image
FROM n8nio/n8n:latest

# Install Puppeteer
USER root
RUN npm install puppeteer --prefix /usr/local/lib/node_modules/n8n --unsafe-perm=true

# Switch back to the n8n user
USER node