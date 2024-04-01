FROM php:8.3-apache

# Install system dependencies
RUN rm /etc/apt/preferences.d/no-debian-php && apt-get update && apt-get install -y \
    certbot \
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
RUN a2enmod rewrite ssl
RUN mkdir /var/www/laravel
RUN mkdir /var/www/laravel/public
RUN mkdir /etc/apache2/ssl
RUN usermod -u 1000 www-data
COPY apache2/sites-available /etc/apache2/sites-available
COPY apache2/ssl/* /etc/apache2/ssl/
RUN a2dissite 000-default
RUN a2ensite laravel
RUN service apache2 restart

WORKDIR /var/www/laravel

EXPOSE 80
EXPOSE 443


#openssl genrsa -out pilgrimconnect.co.uk.key 2048
#openssl req -new -key pilgrimconnect.co.uk.key -out pilgrimconnect.co.uk.csr
#openssl req -x509 -sha256 -days 365 -key pilgrimconnect.co.uk.key -out pilgrimconnect.co.uk.crt
#openssl x509 -text -noout -in pilgrimconnect.co.uk.crt
#
#
#sudo certbot certonly --webroot -w /var/www/laravel/public -d pilgrimconnect.co.uk -d www.pilgrimconnect.co.uk
