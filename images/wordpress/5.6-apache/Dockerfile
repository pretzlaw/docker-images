FROM pretzlaw/php:5.6-apache

# WP-CLI
RUN apt install -y less
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod ugo+x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Config
RUN a2enmod rewrite
RUN a2enmod alias
