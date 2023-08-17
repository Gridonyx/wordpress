FROM wordpress:latest

COPY ./custom-php.ini /usr/local/etc/php/conf.d/

# Download the latest WordPress files
COPY --from=wordpress:latest /usr/src/wordpress/ /var/www/html/

# Copy theout Wordpress files
COPY ./wp-config.php /var/www/html/
COPY ./.htaccess /var/www/html/
# COPY ./wp-content/ /var/www/html/wp-content/

ARG MYSQLPASSWORD
ARG MYSQLHOST
ARG MYSQLPORT
ARG MYSQLDATABASE
ARG MYSQLUSER

ARG PORT

ENV WORDPRESS_DB_HOST=$MYSQLHOST:$MYSQLPORT
ENV WORDPRESS_DB_NAME=$MYSQLDATABASE
ENV WORDPRESS_DB_USER=$MYSQLUSER
ENV WORDPRESS_DB_PASSWORD=$MYSQLPASSWORD
ENV WORDPRESS_TABLE_PREFIX="RW_"

ENV PORT=$PORT

# ENV WORDPRESS_FS_METHOD="direct"


RUN echo "ServerName 0.0.0.0" >> /etc/apache2/apache2.conf

RUN echo "DirectoryIndex index.php index.html" >> /etc/apache2/apache2.conf

CMD ["apache2-foreground"]
