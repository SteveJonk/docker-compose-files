# Start with the n8n base image
FROM n8nio/n8n:latest

# Switch to root to install dependencies
USER root

# Install Chromium and Xvfb dependencies
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    xvfb \
    bash \
    font-noto-emoji \
    && rm -rf /var/cache/apk/*

# Install Puppeteer
RUN npm install puppeteer --prefix /usr/local/lib/node_modules/n8n --unsafe-perm=true

# Install Puppeteer's browser binaries
RUN npx @puppeteer/browsers install chrome

# Set environment variables for Puppeteer and Xvfb
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV CHROMIUM_PATH=/usr/bin/chromium-browser

# Copy our custom entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && \
    chown node:node /entrypoint.sh

# Switch back to the n8n user
USER node

# Start Xvfb and then n8n
ENTRYPOINT ["/entrypoint.sh"]