FROM nginx:alpine

COPY . /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

RUN echo 'server { \
    listen 10000; \
    server_name _; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 10000

CMD ["nginx", "-g", "daemon off;"]