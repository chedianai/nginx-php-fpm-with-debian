FROM php:7.1-fpm

MAINTAINER Biglazy <qihongchuan@vchangyi.com>

RUN apt-get update -y && \
    apt-get install apt-utils wget nginx git -y && \
    apt-get install fontconfig libxext6 libxrender1 xfonts-75dpi xfonts-base xfonts-utils libfontenc1 libxfont1 x11-common \
    xfonts-encodings zlib1g-dev libzip-dev -y && \
    docker-php-ext-install -j$(nproc) zip && \
    wget https://getcomposer.org/download/1.8.4/composer.phar -P /usr/local/bin/ && \
    chmod +x /usr/local/bin/composer.phar && \
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer && \
    wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb -P /root && \
    dpkg -i /root/wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    rm -f /root/wkhtmltox_0.12.5-1.stretch_amd64.deb

EXPOSE 80

CMD service nginx start && php-fpm