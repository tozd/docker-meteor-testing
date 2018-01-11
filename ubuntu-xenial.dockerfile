FROM tozd/base:ubuntu-xenial

ENV HOME /

RUN apt-get update -q -q && \
 apt-get --yes --force-yes install curl python build-essential git && \
 export METEOR_ALLOW_SUPERUSER=true && \
 curl https://install.meteor.com/ | sed s/--progress-bar/-sL/g | sh && \
 apt-get --yes --force-yes purge curl && \
 apt-get --yes --force-yes autoremove && \
 adduser --system --group meteor --home / && \
 export "NODE=$(find /.meteor/ -path '*bin/node' | grep '/.meteor/packages/meteor-tool/' | sort | head -n 1)" && \
 ln -sf ${NODE} /usr/local/bin/node && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm
