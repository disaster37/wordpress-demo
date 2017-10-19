FROM debian:latest

ARG http_proxy
ARG https_proxy

RUN apt-get update
RUN apt-get install -y apache2 php curl php-mysql
RUN curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-4.8.2.tar.gz"
RUN tar -xzf wordpress.tar.gz -C /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY apache2-foreground /usr/bin/
RUN chmod +x /usr/bin/apache2-foreground

CMD ["apache2-foreground"]