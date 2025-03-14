#!/bin/bash

#---------------------------------------------------wp installation---------------------------------------------------#

# wp-cli installation
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# wp-cli permission
chmod +x wp-cli.phar
# wp-cli move to bin
mv wp-cli.phar /usr/local/bin/wp
# go to wordpress directory
cd /var/www/wordpress
# give permission to wordpress directory
chmod -R 755 /var/www/wordpress/
# change owner of wordpress directory to www-data
chown -R www-data:www-data /var/www/wordpress

#---------------------------------------------------ping mariadb---------------------------------------------------#

# check if mariadb is up and running
ping_mariadb_container()
{
    nc -zv mariadb 3306 > /dev/null
    return $?
}

start_time=$(date +%s) # get the current time in seconds
end_time=$((start_time + 20)) # set the end time to 20 seconds after the start time
while [ $(date +%s) -lt $end_time ]; do # loop until the current time is greater than the end time
    ping_mariadb_container
    if [ $? -eq 0 ]; then
        echo "[========MARIADB IS UP AND RUNNING========]"
        break
    else
        echo "[========WAITING FOR MARIADB TO START...========]"
        sleep 1
    fi
done

if [ $(date +%s) -ge $end_time ]; then # check if the current time is greater than or equal to the end time
    echo "[========MARIADB IS NOT RESPONDING========]"
fi

#---------------------------------------------------wp installation---------------------------------------------------##---------------------------------------------------wp installation---------------------------------------------------#

check_Wordpress_files()
{
    wp core is-installed --path=/var/www/wordpress/ --allow-root > /dev/null
    return $?
}

if ! check_Wordpress_files ; then
    echo "[========WordPress Files installation========]"
    # download wordpress core files
    wp core download --allow-root
    # create wp-config.php file with database details
    wp core config --dbhost=$MYSQL_DB:3306 --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --allow-root
    # install wordpress with the given title, admin username, password and email
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_N --admin_password=$WP_ADMIN_P --admin_email=$WP_ADMIN_E --allow-root
    #create a new user with the given username, email, password and role
    wp user create $WP_U_NAME $WP_U_EMAIL --user_pass=$WP_U_PASS --role=$WP_U_ROLE --allow-root

    #installing redis
    chmod -R 777 /var/www/wordpress/
    wp plugin install redis-cache --path=/var/www/wordpress/ --activate --allow-root
    wp config set WP_REDIS_HOST $WP_REDIS_HOST --add --allow-root --path=/var/www/wordpress/
    wp config set WP_REDIS_PORT $WP_REDIS_PORT --add --allow-root --path=/var/www/wordpress/
    wp config set $WP_REDIS_DATABASE --add --allow-root --path=/var/www/wordpress/
    wp redis enable --path=/var/www/wordpress/ --allow-root
else
    echo "WordPress Files already installed !"
fi


#---------------------------------------------------php config---------------------------------------------------#

# change listen port from unix socket to 9000
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
# create a directory for php-fpm
mkdir -p /run/php
# start php-fpm service in the foreground to keep the container running
/usr/sbin/php-fpm7.4 -F
