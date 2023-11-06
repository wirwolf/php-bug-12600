#!/usr/bin/env bash
if [ ! -f /usr/local/etc/php-fpm.d/www.conf ]; then
    echo "File /usr/local/etc/php-fpm.d/www.conf does not exist. Exit"
    exit 1
fi
if [ ! -f /usr/local/etc/php-fpm.d/global.conf ]; then
    echo "File /usr/local/etc/php-fpm.d/global.conf does not exist. Exit"
    exit 1
fi
if [ ! -f /usr/local/etc/php-fpm.d/docker.conf ]; then
    echo "File /usr/local/etc/php-fpm.d/docker.conf does not exist. Exit"
    exit 1
fi

cat /usr/local/etc/php-fpm.d/global.conf | envsubst > /tmp/global.conf
cat /tmp/global.conf > /usr/local/etc/php-fpm.d/global.conf

cat /usr/local/etc/php-fpm.d/docker.conf | envsubst > /tmp/docker.conf
cat /tmp/docker.conf > /usr/local/etc/php-fpm.d/docker.conf

cat /usr/local/etc/php-fpm.d/www.conf | envsubst > /tmp/www.conf
cat /tmp/www.conf > /usr/local/etc/php-fpm.d/www.conf