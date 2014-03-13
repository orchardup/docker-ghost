FROM dockerfile/nodejs
MAINTAINER Ben Firshman "ben@orchardup.com", Nicolas LAURENT "innercircle@aegypius.com"

RUN curl -L https://github.com/TryGhost/Ghost/releases/download/0.4.1/Ghost-0.4.1.zip > /tmp/ghost.zip
RUN useradd ghost
RUN mkdir -p /opt/ghost
WORKDIR /opt/ghost
RUN unzip /tmp/ghost.zip
RUN npm install --production

# Volumes
RUN mkdir /data
VOLUME ["/data"]

ADD config.js /opt/ghost/config.js

# Theme support
WORKDIR /opt/ghost/content/themes
ADD ./themes.txt /tmp/themes.txt
RUN xargs -L 1 git clone --depth=1 < /tmp/themes.txt

# Fix permissions
RUN chown -R ghost:ghost /opt/ghost

# Setup startup command
ADD run /usr/local/bin/run

ENV NODE_ENV production
ENV GHOST_URL http://my-ghost-blog.com

WORKDIR /opt/ghost

EXPOSE 2368
CMD ["/usr/local/bin/run"]

