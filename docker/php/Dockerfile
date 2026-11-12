# image php avec serveur apache déjà dedans
# plus besoin de symfony serve
FROM php:8.3-apache

#outils système et extensions
# https://getcomposer.org/doc/00-intro.md#system-requirements
# https://symfony.com/doc/7.4/setup.html#technical-requirements
# extensions mongodb et pdo pour parler aux bdd
RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip libicu-dev libssl-dev pkg-config \
    && docker-php-ext-install intl pdo_mysql opcache \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && rm -rf /var/lib/apt/lists/*

# copîer composer depuis docker 
# dans l'image php, dans le dossier des programmes de linux
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer 

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

# voir memo_DOCKER l.149 pour epxlications
# Réglage intenre à Apache : servir le dossier public/ de Symfony (et non /var/www/html)
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# (voir le fichier symfony.conf) =>  Toutes les adresses (/menus /contact etc...) sont envoyées à public/index.php
# réglage complémentaire pour Apache: si le fichier demandé n'existe pas, on le odnne a index.php qui, s'il ne ocnnait pas la route -> 404
COPY symfony.conf /etc/apache2/conf-enabled/symfony.conf

# Dossier où je me place : là où sera mon site
WORKDIR /var/www/html
