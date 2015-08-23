FROM nginx:1.9.4

COPY root /

VOLUME /munki_repo
EXPOSE 80
