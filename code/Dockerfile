# Use the official PHP image as the base image
FROM php:8.2-fpm

# Arguments
ARG user
ARG uid

# Clear Cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install system dependencies
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip unzip vim

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Download php extension installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions

# Install extensions for php
RUN install-php-extensions exif
RUN install-php-extensions pdo_mysql
RUN install-php-extensions mysqli
RUN install-php-extensions bcmath
RUN install-php-extensions ctype
RUN install-php-extensions fileinfo
RUN install-php-extensions json
RUN install-php-extensions mbstring
RUN install-php-extensions openssl
RUN install-php-extensions PDO
RUN install-php-extensions tokenizer
RUN install-php-extensions pdo_pgsql
RUN install-php-extensions pgsql
RUN install-php-extensions opcache
RUN install-php-extensions redis
RUN install-php-extensions gd
RUN install-php-extensions zip

# Set the working directory
WORKDIR /var/www/

# Copy the Laravel project files to the container
COPY . .

# Set permissions (you might want to be more restrictive than 777)
RUN chmod -R 777 storage bootstrap/cache public

# Expose the port for the PHP-FPM server
EXPOSE 9000

# CREATE USER AND GIVE PROJECT PERMISSION
RUN groupadd -g 1000 sharifGroup && useradd -u 1000 -g 1000 sharif
USER sharif

# Running the composer
COPY ./.docker/entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]

# Start PHP-FPM
CMD ["php-fpm"]
