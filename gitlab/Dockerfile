FROM gitlab/gitlab-ce:latest

RUN mkdir /tmpconfig
ADD defaultConfigGitlab/ /tmpconfig
ADD gitlabinit.sh /gitlabinit.sh
RUN chmod +x /gitlabinit.sh

EXPOSE 80 443 22

CMD ["/gitlabinit.sh"]
