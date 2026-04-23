FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libxml2-dev \
    libicu-dev \
    libzip-dev \
    libbz2-dev \
    libldap2-dev \
    unzip \
    curl \
    netcat-openbsd \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) mysqli pdo_mysql gd exif zip bz2 xml intl opcache ldap \
    && a2enmod rewrite \
    && echo "session.cookie_httponly = On" > /usr/local/etc/php/conf.d/glpi.ini \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/glpi-project/glpi/releases/download/10.0.16/glpi-10.0.16.tgz /tmp/glpi.tgz
RUN tar -xzf /tmp/glpi.tgz -C /var/www/html --strip-components=1 \
    && rm /tmp/glpi.tgz \
    && mkdir -p /var/www/html/files /var/www/html/config \
    && chown -R www-data:www-data /var/www/html

COPY glpi-apache.conf /etc/apache2/sites-available/000-default.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
