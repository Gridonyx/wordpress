FROM wordpress:latest

COPY ./custom-php.ini /usr/local/etc/php/conf.d/

# Download the latest WordPress files
COPY --from=wordpress:latest /usr/src/wordpress/ /var/www/html/

# Copy theout Wordpress files
COPY ./wp-config.php /var/www/html/
COPY ./.htaccess /var/www/html/
# COPY ./wp-content/ /var/www/html/wp-content/

#ARG MYSQLPASSWORD
#ARG MYSQLHOST
#ARG MYSQLPORT
#ARG MYSQLDATABASE
#ARG MYSQLUSER
#ARG WP_REDIS_HOST
#ARG WP_REDIS_PORT
#ARG WP_REDIS_USER
#ARG WP_REDIS_PASSWORD
#ARG PORT

#ENV WORDPRESS_DB_HOST=$MYSQLHOST:$MYSQLPORT
#ENV WORDPRESS_DB_NAME=$MYSQLDATABASE
#ENV WORDPRESS_DB_USER=$MYSQLUSER
#ENV WORDPRESS_DB_PASSWORD=$MYSQLPASSWORD
#ENV WORDPRESS_TABLE_PREFIX="RW_"
#ENV WP_REDIS_HOST=$WP_REDIS_HOST
#ENV WP_REDIS_PORT=$WP_REDIS_PORT
#ENV WP_REDIS_PASSWORD=${WP_REDIS_USER},$WP_REDIS_PASSWORD

#ENV PORT=$PORT

# ENV WORDPRESS_FS_METHOD="direct"


RUN echo "ServerName 0.0.0.0" >> /etc/apache2/apache2.conf

RUN echo "DirectoryIndex index.php index.html" >> /etc/apache2/apache2.conf

CMD ["apache2-foreground"]
