FROM ubuntu:14.04

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
RUN mkdir /munki_repo
RUN mkdir /munki_repo/pkgs
RUN mkdir /munki_repo/pkgsinfo
RUN mkdir /munki_repo/catalogs
RUN mkdir /munki_repo/manifests
RUN chown -R www-data /munki_repo
RUN htpasswd -bc /etc/apache2/webdav.password mwaadmin password
RUN chown root:www-data /etc/apache2/webdav.password
RUN chmod 640 /etc/apache2/webdav.password

VOLUME /munki_repo
EXPOSE 80

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
