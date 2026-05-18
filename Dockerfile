FROM php:8.2-apache

RUN apt-get update \
	&& apt-get install -y libzip-dev zip unzip git curl \
	&& docker-php-ext-install mysqli pdo pdo_mysql \
	&& a2enmod rewrite \
	&& rm -rf /var/lib/apt/lists/*

# Install Composer binary from official image
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
COPY . /var/www/html

# Ensure permissions
RUN chown -R www-data:www-data /var/www/html \
	&& chmod -R 755 /var/www/html

# Entrypoint replaces port 80 with $PORT (Railway provides $PORT)
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2-foreground"]