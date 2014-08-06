docker-munki
-----
A container that serves static files at http://munki/repo using nginx.
nginx expect the munki repo content to be located at /munki_repo. use a volume container and the --volumes-from option to add files.
