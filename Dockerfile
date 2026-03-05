# syntax=docker/dockerfile:1.6

FROM nginx:1.27-alpine

# Configura charset e otimiza layer de conteúdo estático
RUN sed -i 's/sendfile on;/sendfile off;/' /etc/nginx/nginx.conf \
    && sed -i 's/# charset .*;/charset utf-8;/' /etc/nginx/nginx.conf

# Copia arquivos estáticos para o diretório padrão do Nginx
COPY index.html /usr/share/nginx/html/index.html
COPY styles.css /usr/share/nginx/html/styles.css
COPY script.js /usr/share/nginx/html/script.js

# Expõe a porta padrão do Nginx
EXPOSE 80

# Usa o entrypoint padrão do Nginx (não sobrescreva CMD)
