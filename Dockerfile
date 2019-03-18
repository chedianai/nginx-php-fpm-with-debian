FROM php:7.1-fpm

MAINTAINER Biglazy <qihongchuan@vchangyi.com>

RUN apt update -y && \
    apt install nginx -y && \
    service nginx start