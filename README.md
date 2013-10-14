docker-ghost
============

Run [Ghost](http://ghost.org) with Docker:

    $ docker run -d -p 2368:2368 -e GHOST_URL=http://my-ghost-blog.com orchardup/ghost

Your Ghost blog will be running on [http://127.0.0.1:2368](http://127.0.0.1:2368).


Running on Orchard
------------------

To host Ghost on [Orchard](https://orchardup.com):

    $ orchard apps create myapp
    $ orchard -a myapp docker run -d -p 80:2368 -v /data -e GHOST_URL=http://my-ghost-blog.com orchardup/ghost


Configuration
-------------

This image can be configured with environment variables:

 - `GHOST_URL`: The url to use when providing links to the site, E.g. in RSS and email.


Caveats
-------

You will lose your uploads if you upgrade Ghost by replacing the image. This is because there is no way of specifying an upload directory for Ghost yet, but [they're working on it](https://github.com/TryGhost/Ghost/issues/635). The database is saved in a volume called `/data` so it will persist just fine.


