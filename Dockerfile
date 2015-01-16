FROM nginx

MAINTAINER nmcspadden@gmail.com

ENV PUPPET_VERSION 3.7.3

RUN mkdir -p /munki_repo
Run mkdir -p /etc/nginx/sites-enabled/
ADD nginx.conf /etc/nginx/nginx.conf
ADD munki-repo.conf /etc/nginx/sites-enabled/
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y ca-certificates
RUN wget https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
RUN dpkg -i puppetlabs-release-wheezy.deb
RUN apt-get update
RUN apt-get install -y puppet=$PUPPET_VERSION-1puppetlabs1

VOLUME /munki_repo

EXPOSE 80
