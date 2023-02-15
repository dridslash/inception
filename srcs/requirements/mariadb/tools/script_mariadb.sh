#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > database.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';" >> database.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> database.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql

mysql < database.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld