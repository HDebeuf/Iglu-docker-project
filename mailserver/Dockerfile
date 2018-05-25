FROM tvial/docker-mailserver:latest

ENV MAIL_USER_LIST=("Prénom Nom","Prénom Nom","Prénom Nom")


ADD mailservinit.sh /mailservinit.sh
RUN chmod +x /mailservinit.sh
ADD https://raw.githubusercontent.com/tomav/docker-mailserver/master/setup.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 25 587 143 465 993 110 995 4190

ENTRYPOINT ["/mailservinit.sh"]

CMD supervisord -c /etc/supervisor/supervisord.conf
