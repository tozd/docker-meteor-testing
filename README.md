# tozd/meteor-testing

**DEPRECATED: Images are not maintained and not regularly updated anymore.**

<https://gitlab.com/tozd/docker/meteor-testing>

Available as:

- [`tozd/meteor-testing`](https://hub.docker.com/r/tozd/meteor-testing)
- [`registry.gitlab.com/tozd/docker/meteor-testing`](https://gitlab.com/tozd/docker/meteor-testing/container_registry)

## Image inheritance

[`tozd/base`](https://gitlab.com/tozd/docker/base) ← `tozd/meteor-testing`

See also [`tozd/meteor`](https://gitlab.com/tozd/docker/meteor).

## Tags

- `ubuntu-xenial-*`: Meteor versions using Ubuntu 16.04 LTS (Xenial) as base
- `ubuntu-bionic-*`: Meteor versions using Ubuntu 18.04 LTS (Bionic) as base
- `ubuntu-focal-*`: Meteor versions using Ubuntu 20.04 LTS (Focal) as base
- `ubuntu-jammy-*`: Meteor versions using Ubuntu 22.04 LTS (Jammy) as base

Some versions are not build because [they have issues](https://gitlab.com/tozd/docker/meteor/-/blob/master/blocklist.txt).

## Description

A Docker image which includes everything necessary to test [Meteor](https://www.meteor.com/) apps in CI:

- All Meteor versions, one Docker image per version, for reproducible builds.
- A fixed version of Chromium and its chromedriver (72.0.3626.121).
- Xvfb.
- From Meteor 1.6 on, it also includes:
  - Selenium webdriver 3.6.0, compatible with installed chromedriver.
  - `puppeteer-core` 1.11.0, compatible with installed Chromium.

Simply use it together with your Meteor app and then run your
`meteor test --full-app` or any other testing command.

There is also a shell script `/run-test-packages.sh` which runs `meteor test-packages` for the current
working directory using Chromium and puppeteer to run both client and server package tests.

## GitHub mirror

There is also a [read-only GitHub mirror available](https://github.com/tozd/docker-meteor-testing),
if you need to fork the project there.
