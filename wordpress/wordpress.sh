#!/bin/sh
useradd webmaster
echo "webmaster:password" | chpasswd
chown -R webmaster:www-data /var/www
find /var/www -type d -exec chmod g+s {} \;
chmod g+w /var/www/wordpress/public_html/wp-content
#chmod -R g+w /var/www/wordpress/public_html/wp-content/themes
#chmod -R g+w /var/www/wordpress/public_html/wp-content/plugins

sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/Options Indexes FollowSymLinks/Options -Indexes/' /etc/apache2/apache2.conf
sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

sed -i "s/projectdomain/$PROJECT_DOMAIN/g" /etc/apache2/sites-available/wordpress.conf


a2enmod rewrite
cat > /var/www/wordpress/public_html/.htaccess <<-'EOF'
				# BEGIN WordPress
				<IfModule mod_rewrite.c>
				RewriteEngine On
				RewriteBase /
				RewriteRule ^index\.php$ - [L]
				RewriteCond %{REQUEST_FILENAME} !-f
				RewriteCond %{REQUEST_FILENAME} !-d
				RewriteRule . /index.php [L]
				</IfModule>
				# END WordPress
			EOF
sed -i "s/db_name_project/$WP_MYSQL_DATABASE/g" /var/www/wordpress/public_html/wp-config.php
sed -i "s/db_user_project_name/$MYSQL_USER/g" /var/www/wordpress/public_html/wp-config.php
sed -i "s/db_user_project_password/$MYSQL_PASSWORD/g" /var/www/wordpress/public_html/wp-config.php
sed -i "s/db_host_project/$MYSQL_DATABASE_HOST/g" /var/www/wordpress/public_html/wp-config.php

curl https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/wordpress/public_html/wp-config.php

sed -i "s/databasehost/$MYSQL_DATABASE_HOST/g" /init-users.php
sed -i "s/databaseusername/$MYSQL_USER/g" /init-users.php
sed -i "s/databaseuserpassword/$MYSQL_PASSWORD/g" /init-users.php
sed -i "s/databasename/$WP_MYSQL_DATABASE/g" /init-users.php
sed -i "s/thewebmasterlogin/$WEBMASTER_LOGIN/g" /init-users.php
sed -i "s/thewebmasterpassword/$WEBMASTER_PASSWORD/g" /init-users.php
sed -i "s/thewebsiteurl/$PROJECT_DOMAIN/g" /init-users.php

cd /etc/apache2/sites-available
a2ensite wordpress.conf
a2dissite 000-default.conf

service apache2 reload

php init-users.php

/usr/sbin/apache2ctl -D FOREGROUND
