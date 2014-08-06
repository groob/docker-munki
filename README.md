docker-munki
-----
A container that serves static files at http://munki/repo using nginx.
nginx expect the munki repo content to be located at /munki_repo. use a volume container and the --volumes-from option to add files.

# Creating a Data Container.
The following command will create a lightweight container with a folder at /munki_repo. 
```bash
/usr/bin/docker run --name munki-data -v /munki_repo busybox
```
My files are located on the host, so I mount that folder as well: 
```bash
/usr/bin/docker run --name munki-data -v /mnt/docker_data/munki_repo:/munki_repo busybox
```

For more info on data containers read [Tom Offermann](http://www.offermann.us/2013/12/tiny-docker-pieces-loosely-joined.html)'s blog post and the [official documentation](https://docs.docker.com/userguide/dockervolumes/). 

# Running the munki container.
The following command will launch the nginx container with the mounted volume.
```bash
docker run --name munki --rm -p 80:80 --volumes-from munki-data groob/docker-munki
```

# TODO
* Configure SSL option
