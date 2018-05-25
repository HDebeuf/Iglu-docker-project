#!/bin/sh
openssl genrsa -des3 -passout pass:mypassword -out "/etc/traefik/ssl/$IGLU_DOMAIN-wildcard.key" 2048 -noout
openssl rsa -in "/etc/traefik/ssl/$IGLU_DOMAIN-wildcard.key" -passin pass:mypassword -out "/etc/traefik/ssl/$IGLU_DOMAIN-wildcard.key"
openssl req -new -key "/etc/traefik/ssl/$IGLU_DOMAIN-wildcard.key" -out "/etc/traefik/ssl/$IGLU_DOMAIN-wildcard.csr" -passin pass:mypassword \
    -subj "/C=BE/ST=Luxembourg/L=Marche-en-Famenne/O=iglu/OU=devops/CN=$IGLU_DOMAIN/emailAddress=webmaster@$IGLU_DOMAIN"
openssl x509 -req -days 365 -in "/etc/traefik/ssl/$IGLU_DOMAIN-wildcard.csr" -signkey "/etc/traefik/ssl/$IGLU_DOMAIN-wildcard.key" -out "/etc/traefik/ssl/$IGLU_DOMAIN-wildcard.crt"

TRAEFIK_HTPASS=$(htpasswd -nb "$TRAEFIK_USER" "$TRAEFIK_USER_PASS")
sed -i "s encryptedhtpassword $TRAEFIK_HTPASS g" /etc/traefik/traefik.toml
sed -i "s/virtualhostcert/$IGLU_DOMAIN/g" /etc/traefik/traefik.toml
cat /etc/traefik/traefik.toml
ls /etc/traefik/ssl

#fork from https://github.com/containous/traefik-library-image/blob/f6dc778627f1df208b28c8112d9aecd7840660be/alpine/entrypoint.sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- traefik "$@"
fi

# if our command is a valid Traefik subcommand, let's invoke it through Traefik instead
# (this allows for "docker run traefik version", etc)
if traefik "$1" --help 2>&1 >/dev/null | grep "help requested" > /dev/null 2>&1; then
    set -- traefik "$@"
fi

exec "$@"
