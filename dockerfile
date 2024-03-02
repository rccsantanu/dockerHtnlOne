FROM nginx:alpine
LABEL author="Santanu Aich"

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy index.html
COPY index.html /usr/share/nginx/