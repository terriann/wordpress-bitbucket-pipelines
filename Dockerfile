FROM php:7.1.7-apache
MAINTAINER Johns Beharry <johns@peakshift.com>

# PHP Config + WP CLI sudo adapter
COPY config/php.ini /usr/local/etc/php/
COPY scripts/wp-su.sh /bin/wp

ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apt-get update \
  && apt-get install -y \
    apt-utils \
    sudo \
    build-essential \
    git-core \
    nasm \
    autoconf \
    bison \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
  # PHP Extentions
  && docker-php-ext-install mysqli \
  && docker-php-ext-install -j$(nproc) iconv mcrypt zip gd \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && a2enmod rewrite \
  # MySQL
  && apt-get install -y mysql-server --no-install-recommends \
  # Ruby
  && sudo apt-get install -y ruby-full \
  && sudo gem install sass \
  # NodeJS
  && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && sudo apt-get install -y nodejs \
  && npm install -g grunt-cli \
  && npm install -g bower \
  # Codeception
  && sudo curl -LsS http://codeception.com/codecept.phar -o /bin/codecept \
  && sudo chmod a+x /bin/codecept \
  # WP-CLI
  && curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /bin/wp-cli.phar /bin/wp \
  # Composer
  && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /bin/composer

WORKDIR /var/src

EXPOSE 80
