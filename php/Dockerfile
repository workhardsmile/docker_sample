FROM daocloud.io/php:7.1-fpm

# Install env
ADD sources.list   /etc/apt/sources.list
#RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get -o Acquire::Check-Valid-Until=false update
#RUN apt-get install -y php7.1 php7.1-mbstring php7.1-xml mcrypt php7.1-mcrypt
RUN apt-get install -y \
        git \
        libgearman-dev \
        libmemcached-dev \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        vim \
        && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install zip \
        && docker-php-ext-install gd \
        && docker-php-ext-install mbstring \
        && docker-php-ext-install mcrypt \
        && docker-php-ext-install pdo_mysql

# Install PHP extensions
#COPY memcached.tgz /home/memcached.tgz
#RUN pecl install /home/memcached.tgz && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini

# PHP config
# ADD php.ini    /usr/local/etc/php/php.ini
ADD php-fpm.conf    /usr/local/etc/php-fpm.conf

# Composer
ADD composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer
RUN /usr/local/bin/composer config -g repo.packagist composer https://packagist.phpcomposer.com

WORKDIR /opt/htdocs/covision

# Write Permission
RUN usermod -u 1000 www-data

EXPOSE 9000
VOLUME ["/opt"]
CMD ["php-fpm"]
