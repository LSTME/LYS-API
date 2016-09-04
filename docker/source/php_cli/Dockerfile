FROM php:7.0-cli

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  libfreetype6-dev \
  libjpeg-dev \
  libmcrypt-dev \
  libpng12-dev \
  libxrender1 \
  libxtst6 \
  libicu-dev \
  libcurl4-openssl-dev
RUN apt-get install -y --no-install-recommends curl

RUN docker-php-ext-install mcrypt
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
 && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
 && docker-php-ext-install pdo_mysql \
 && docker-php-ext-install mysqli
RUN docker-php-ext-install intl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install exif
RUN docker-php-ext-configure gd --enable-gd-native-tff --with-jpeg-dir=/usr/lib/x86_64-linux-gnu --with-png-dir=/usr/lib/x86_64-linux-gnu --with-freetype-dir=/usr/lib/x86_64-linux-gnu \
 && docker-php-ext-install gd
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pcntl

RUN pecl install xdebug-beta
RUN docker-php-ext-enable xdebug

COPY ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
COPY app.ini /usr/local/etc/php/conf.d/app.ini

RUN usermod -u 1000 www-data
