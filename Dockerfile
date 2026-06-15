FROM nginx:alpine

COPY . /usr/share/nginx/html

# Support SPA routing - redirect all 404s to index.html
RUN echo 'server { \
    listen 80; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
