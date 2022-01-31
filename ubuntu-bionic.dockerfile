FROM registry.gitlab.com/tozd/docker/base:ubuntu-bionic

ENV HOME /
ENV METEOR_WAREHOUSE_DIR /.meteor
ENV METEOR_NO_RELEASE_CHECK 1
ENV METEOR_ALLOW_SUPERUSER true

ARG METEOR_VERSION

# Keep this layer in sync with tozd/meteor.
RUN apt-get update -q -q && \
 apt-get --yes --force-yes install curl python build-essential git && \
 curl https://install.meteor.com/?release=${METEOR_VERSION} | sed s/--progress-bar/-sL/g | sh && \
 installed_version="$(meteor --version)" && echo "Installed $installed_version, wanted ${METEOR_VERSION}" && [ "$installed_version" = "Meteor ${METEOR_VERSION}" ] && \
 apt-get --yes --force-yes purge curl && \
 apt-get --yes --force-yes autoremove && \
 adduser --system --group meteor --home / && \
 export "NODE=$(find /.meteor/ -path '*bin/node' | grep '/.meteor/packages/meteor-tool/' | sort | head -n 1)" && \
 ln -sf ${NODE} /usr/local/bin/node && \
 ln -sf "$(dirname "$NODE")/npm" /usr/local/bin/npm && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

RUN apt-get update -q -q && \
 apt-get --yes --force-yes install wget \
  psmisc xauth xvfb libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 \
  libnss3 libxss1 libasound2 libxtst6 xdg-utils && \
 cd / && \
 wget http://launchpadlibrarian.net/413897613/chromium-codecs-ffmpeg-extra_72.0.3626.121-0ubuntu0.16.04.1_amd64.deb && \
 wget http://launchpadlibrarian.net/413897611/chromium-browser_72.0.3626.121-0ubuntu0.16.04.1_amd64.deb && \
 wget http://launchpadlibrarian.net/413897612/chromium-chromedriver_72.0.3626.121-0ubuntu0.16.04.1_amd64.deb && \
 dpkg -i chromium-browser_72.0.3626.121-0ubuntu0.16.04.1_amd64.deb chromium-codecs-ffmpeg-extra_72.0.3626.121-0ubuntu0.16.04.1_amd64.deb chromium-chromedriver_72.0.3626.121-0ubuntu0.16.04.1_amd64.deb && \
 rm -f *.deb && \
 if [ "$(printf '%s\n' "v8" "$(node --version)" | sort -V | head -n1)" = "v8" ]; then npm install --unsafe-perm --allow-root selenium-webdriver@3.6.0 puppeteer-core@1.11.0 mkdirp; fi && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

ENV PATH="${PATH}:/usr/lib/chromium-browser"

COPY ./run-test-packages.sh /
COPY ./puppeteerRunner.js /
