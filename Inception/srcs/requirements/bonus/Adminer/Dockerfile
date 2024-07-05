FROM debian:bullseye

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# Create the directory for Adminer
RUN mkdir -p /var/www/html

# Install necessary packages
RUN apt-get install -y wget php php-fpm php-mysqli

# Configure PHP-FPM to listen on port 5000 and download Adminer
RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 5000/g' /etc/php/7.4/fpm/pool.d/www.conf \
    && wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php -O /var/www/html/adminer.php

# Set permissions for Adminer.php
RUN chown -R www-data:www-data /var/www/html/adminer.php \
    && chmod 755 /var/www/html/adminer.php

# Ensure the PHP-FPM run directory exists
RUN mkdir -p /run/php

# Expose port 5000
EXPOSE 5000

# Set the entrypoint to start PHP-FPM
ENTRYPOINT ["php-fpm7.4", "-F"]
