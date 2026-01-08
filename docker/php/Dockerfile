FROM php:7.4-fpm

# System packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        mbstring \
        zip \
        gd \
        xml \
        bcmath

COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Copy source
COPY . .

# Permission
RUN chmod -R 777 storage/

# Install dependency
RUN composer install --no-dev --optimize-autoloader
RUN php artisan config:cache

EXPOSE 9000
CMD ["php-fpm"]