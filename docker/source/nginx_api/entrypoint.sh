#!/bin/bash

set -e

echo "upstream php-upstream { server $PHPFPM_HOST:$PHPFPM_PORT; }" > /etc/nginx/conf.d/upstream.conf

sed -i -e "s@THESERVERNAME@$SYMFONY_SERVERNAME@g" /etc/nginx/sites-available/symfony.conf
sed -i -e "s@THEROOTFOLDER@$SYMFONY_ROOT@g" /etc/nginx/sites-available/symfony.conf

chmod -R 777 $SYMFONY_ROOT/../var/cache
chmod -R 777 $SYMFONY_ROOT/../var/logs
chmod -R 777 $SYMFONY_ROOT/../var/sessions

exec "$@"
