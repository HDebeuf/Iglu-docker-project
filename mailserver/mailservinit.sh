#! /bin/sh
#fork from https://github.com/tomav/docker-mailserver/blob/master/setup.sh

##
# Ici ajouter addresses mail sur base d'une array ("Prénom Nom","Prénom Nom","Prénom Nom")
#


./setup.sh email add webmaster@iglu.com Tigrou007
./setup.sh email list
./setup.sh config inspect

#À voir s'il faut retrigger la commande suivante
#supervisord -c /etc/supervisor/supervisord.conf
