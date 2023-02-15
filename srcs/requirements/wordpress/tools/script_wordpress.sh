#!/bin/bash

sleep 1

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$DB_NAME/g"   wp-config.php
sed -i "s/username_here/$DB_USER/g"  wp-config.php
sed -i "s/password_here/$DB_PWD/g"    wp-config.php
sed -i "s/localhost/$DB_HOST/g"    wp-config.php

wp core install --url=$DOMAIN_NAME --title="WP-CLI" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=info@wp-cli.org --skip-email --allow-root

wp user create hello hello@ss.com --role=author --user_pass=123 --allow-root

# wp theme install Twenty-Twenty-Two --activate  --allow-root

wp theme activate twentytwentytwo --allow-root


sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

echo "Wordpress finished work!!!!"

/usr/sbin/php-fpm7.3 -F