FROM registry.gitlab.com/tozd/docker/base:ubuntu-xenial

ENV HOME /
ENV METEOR_NO_RELEASE_CHECK 1
ENV METEOR_ALLOW_SUPERUSER true

ARG METEOR_VERSION

# Keep this layer in sync with tozd/meteor.
RUN apt-get update -q -q && \
 apt-get --yes --force-yes install curl python build-essential git && \
 curl https://install.meteor.com/${METEOR_VERSION:+?release=${METEOR_VERSION}} | sed s/--progress-bar/-sL/g | sh && \
 apt-get --yes --force-yes purge curl && \
 apt-get --yes --force-yes autoremove && \
 adduser --system --group meteor --home / && \
 export "NODE=$(find /.meteor/ -path '*bin/node' | grep '/.meteor/packages/meteor-tool/' | sort | head -n 1)" && \
 ln -sf ${NODE} /usr/local/bin/node && \
 ln -sf "$(dirname "$NODE")/npm" /usr/local/bin/npm && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

RUN apt-get update -q -q && \
 apt-get --no-install-recommends --yes --force-yes install chromium-chromedriver chromium-codecs-ffmpeg-extra chromium-browser \
  psmisc xauth xvfb libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 \
  libnss3 libxss1 libasound2 libxtst6 && \
 cd / && \
 npm install --unsafe-perm selenium-webdriver@3.6.0 mkdirp && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

ENV PATH="${PATH}:/usr/lib/chromium-browser"
