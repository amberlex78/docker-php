FROM php:8.0-cli

ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer -q

ENV XDEBUG_VERSION 3.0.4
RUN pecl install xdebug-$XDEBUG_VERSION docker-php-ext-enable xdebug

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
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install mysqli \
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
