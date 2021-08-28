FROM php:8.0-fpm

# GD
RUN apt-get update && apt-get install -y --no-install-recommends \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libgmp-dev \
    && docker-php-ext-configure gd --with-freetype=/usr/include \
    && docker-php-ext-install gd

# Imagick
RUN apt-get update && apt-get install -y --no-install-recommends  \
    libmagickwand-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick

RUN apt-get update  \
    && apt-get install -y --no-install-recommends \
    libbz2-dev \
    libxml2-dev \
    zlib1g-dev \
    libncurses5-dev \
    libldb-dev \
    libldap2-dev \
    libicu-dev \
    libmemcached-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libsqlite3-dev \
    libzip-dev \
    libonig-dev \
    msmtp \
    curl \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-configure mysqli --with-mysqli=mysqlnd && \
    docker-php-ext-install mysqli \
    bcmath \
    bz2 \
    ftp \
    intl \
    opcache \
    soap \
    sockets \
    zip

RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini
COPY ./conf.d $PHP_INI_DIR/conf.d

WORKDIR /app
