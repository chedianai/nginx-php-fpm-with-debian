FROM php:7.1-fpm

MAINTAINER Biglazy <qihongchuan@vchangyi.com>

RUN apt-get update -y && \
    apt-get install apt-utils nginx -y

EXPOSE 80

CMD service nginx start && php-fpm