FROM ubuntu:12.04
MAINTAINER Ben Firshman "ben@orchardup.com"

RUN apt-get update -qq && apt-get install -qy python-software-properties
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -qq update && apt-get install -qy sudo curl unzip nodejs
RUN curl -L https://en.ghost.org/zip/ghost-0.5.3.zip > /tmp/ghost.zip
RUN useradd ghost
RUN mkdir -p /opt/ghost
RUN mkdir -p /opt/ghost-temp
WORKDIR /opt/ghost-temp
RUN unzip /tmp/ghost.zip
RUN npm install --production

# Volumes
# RUN mkdir /data
# VOLUME ["/data"]


# RUN mkdir /ghostcontent
# VOLUME ["/ghostcontent"]

VOLUME ["/opt/ghost"]

ADD run /usr/local/bin/run
ADD config.js /opt/ghost-temp/config.js
RUN chown -R ghost:ghost /opt/ghost

WORKDIR /opt/ghost

ENV NODE_ENV production
ENV GHOST_URL http://my-ghost-blog.com
EXPOSE 2368
CMD ["/usr/local/bin/run"]

