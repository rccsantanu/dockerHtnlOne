If you want Nginx to serve the content of your HTML page instead of the default Nginx welcome page, you need to ensure that Nginx is configured to serve files from the correct directory. In your Dockerfile, you've copied index.html to /usr/share/nginx/, but the default Nginx configuration may not be set up to serve files from that directory.

To configure Nginx to serve files from /usr/share/nginx/, you can modify the default configuration. Here's how you can do it:

Create a custom Nginx configuration file (nginx.conf) that specifies the correct directory to serve files from:
nginx
Copy code
server {
listen 80;
server_name localhost;

    location / {
        root /usr/share/nginx/;
        index index.html;
    }

}
Update your Dockerfile to include this custom configuration:
Dockerfile
Copy code
FROM nginx:alpine
LABEL author="Santanu Aich"

# Copy custom nginx configuration

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy index.html

COPY index.html /usr/share/nginx/

# No need to set WORKDIR if you're not using it for anything else

With this configuration, Nginx will serve your index.html file when you access the server in your browser. Make sure to rebuild your Docker image with these changes (docker build -t mynginx .) and run your container (docker run -d -p 80:80 mynginx).

# Run

sudo docker run -d -p 8080:80 mynginx
