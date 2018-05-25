#!/bin/sh


sed -i "s/db_name_project/$PS_MYSQL_DATABASE/g" /etc/cont-init.d/init-config.php
sed -i "s/db_user_project_name/$MYSQL_USER/g" /etc/cont-init.d/init-config.php
sed -i "s/db_user_project_password/$MYSQL_PASSWORD/g" /etc/cont-init.d/init-config.php
sed -i "s/db_host_project/$MYSQL_DATABASE_HOST/g" /etc/cont-init.d/init-config.php
sed -i "s/thewebmasterlogin/$WEBMASTER_LOGIN/g" /etc/cont-init.d/init-config.php
sed -i "s/thewebmasterpassword/$WEBMASTER_PASSWORD/g" /etc/cont-init.d/init-config.php
sed -i "s/projectnamewithspaces/$PROJECT_NAME_WITH_SPACES/g" /etc/cont-init.d/init-config.php
sed -i "s/projectdomain/$PROJECT_DOMAIN/g" /etc/cont-init.d/init-config.php

./init
