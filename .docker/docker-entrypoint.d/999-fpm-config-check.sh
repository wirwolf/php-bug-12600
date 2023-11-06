#!/usr/bin/env bash
if ! php-fpm -t; then
    echo "php-fpm configuration is invalid. Exit"
    if [[ ${PHP_FPM_DEBUG_CONFIG:-'false'} == "true" ]]; then
      echo "------------------------------------------------------------------"
      echo "/usr/local/etc/php-fpm.d/global.conf"
      cat /usr/local/etc/php-fpm.d/global.conf
      echo "------------------------------------------------------------------"
      echo "/usr/local/etc/php-fpm.d/docker.conf"
      cat /usr/local/etc/php-fpm.d/docker.conf
      echo "------------------------------------------------------------------"
      echo "/usr/local/etc/php-fpm.d/www.conf"
      cat /usr/local/etc/php-fpm.d/www.conf
      echo "------------------------------------------------------------------"
    fi
    exit 1
fi
