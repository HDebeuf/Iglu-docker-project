#!/bin/sh
#fork from https://github.com/hardware/rainloop/blob/master/rootfs/usr/local/bin/run.sh

# Set attachment size limit
sed -i "s/<UPLOAD_MAX_SIZE>/$UPLOAD_MAX_SIZE/g" /etc/php7/php-fpm.conf /etc/nginx/nginx.conf

# Remove postfixadmin-change-password plugin if exist
if [ -d "/rainloop/data/_data_/_default_/plugins/postfixadmin-change-password" ]; then
  rm -rf /rainloop/data/_data_/_default_/plugins/postfixadmin-change-password
fi

mv /rainloop/data/_data_/_default_/domains/iglu.com.ini /rainloop/data/_data_/_default_/domains/${PROJECT_DOMAIN}.ini

#edit config files
sed -i "s/webmailtitle/$PROJECT_NAME_WITH_SPACES/g" /rainloop/data/_data_/_default_/configs/application.ini

# Fix permissions
chown -R $UID:$GID /rainloop/data /services /var/log /var/lib/nginx

# RUN !
exec su-exec $UID:$GID /bin/s6-svscan /services
