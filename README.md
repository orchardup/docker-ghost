docker-ghost
============

Build from this repository
--------------------------
    $ git clone https://github.com/atroo/docker-ghost.git
    $ cd docker-ghost
    $ docker build -t="docker-ghost" .


Run [Ghost](http://ghost.org) with Docker:

    $ docker run -d -p 2368:2368 --name ghost \
      -e GHOST_URL=http://www.atroo.de \
      -v /opt/ghost/content:/ghostcontent \
      -v /opt/ghost/data:/data \
      docker-ghost

Your Ghost blog will be running on [http://127.0.0.1:2368](http://127.0.0.1:2368). And the database will be persisted to /opt/ghost/data while the uploaded content and your themes are going to reside in /opt/ghost/content. Those two directory can be configured at will, just map them to /ghostcontent and /data .


Running on Orchard
------------------

To host Ghost on [Orchard](https://orchardup.com) (replace `myapp` with a name of your choice):

    $ orchard apps create myapp
    $ orchard -a myapp docker run -d -p 80:2368 -v /data -e GHOST_URL=http://my-ghost-blog.com orchardup/ghost

Run `orchard -a myapp docker ps` to get the IP address it is running on.

Configuration
-------------

This image can be configured with environment variables:

 - `GHOST_URL`: The url to use when providing links to the site, E.g. in RSS and email.


