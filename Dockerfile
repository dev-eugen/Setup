FROM debian:unstable-slim as base

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
        php8.1-fpm php8.1-mbstring php8.1-mysql php8.1-xml php8.1-dom php8.1-zip php8.1-intl \
        php8.1-gd php8.1-imap php8.1-curl php8.1-sqlite php8.1-sybase \
        nginx rsyslog supervisor curl npm \
    && npm install -g n gulp webpack-cli @vue/cli && n 14 \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin \
    && php -r "unlink('composer-setup.php');" \
    && mv /usr/bin/composer.phar /usr/bin/composer \
    && rm -rf /var/lib/apt/lists/* /usr/share/man/* /usr/share/doc/* \
    && rm -rf /etc/nginx/sites-enabled

#COPY ./conf/nginx/sites-enabled /etc/nginx/sites-enabled
COPY ./conf/supervisor/supervisord.conf /etc/supervisor/supervisord.conf

COPY ./entrypoint.sh /

CMD ["/bin/bash", "/entrypoint.sh"]

EXPOSE 80
