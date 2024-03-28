FROM php:8.3-apache

# Install system dependencies
RUN rm /etc/apt/preferences.d/no-debian-php && apt-get update && apt-get install -y \
    apt-utils \
    libjpeg-dev \
    libmcrypt-dev \
    libpng-dev \
    libzip-dev \
    zip \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    git \
    curl \
    nano \
    gnupg2 \
    libxml2-dev \
    php-soap \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    unzip \
    php-redis

# Install Node.js
RUN curl -s https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

# Configure and install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) \
    curl \
    dom \
    fileinfo \
    filter \
    pdo \
    session \
    xml \
    zip \
    pdo_mysql \
    gd \
    iconv \
    soap

# Install PECL extensions
RUN pecl install redis xdebug

# Enable PHP extensions
RUN docker-php-ext-enable redis xdebug

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable Apache modules and configure site
RUN a2enmod rewrite
RUN mkdir /var/www/laravel
RUN mkdir /var/www/laravel/public
RUN usermod -u 1000 www-data
ADD apache2/sites-available /etc/apache2/sites-available
RUN a2dissite 000-default
RUN a2ensite laravel
RUN service apache2 restart

WORKDIR /var/www/laravel