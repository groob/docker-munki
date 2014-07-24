# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM ubuntu:14.04

# Use baseimage-docker's init system.
#CMD ["/sbin/my_init"]


# ...put your own build instructions here...
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  vim \
  apache2 \
  apache2-utils

RUN a2enmod dav
RUN a2enmod dav_fs
RUN rm /etc/apache2/sites-enabled/000-default.conf
ADD 000-default.conf /etc/apache2/sites-enabled/
RUN mkdir /webdav
RUN chown www-data /webdav
RUN htpasswd -bc /etc/apache2/webdav.password mwaadmin password
RUN chown root:www-data /etc/apache2/webdav.password
RUN chmod 640 /etc/apache2/webdav.password

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
