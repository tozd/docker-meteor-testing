# tozd/meteor-testing

<https://gitlab.com/tozd/docker/meteor-testing>

Available as:

* [`tozd/meteor-testing`](https://hub.docker.com/r/tozd/meteor-testing)
* [`registry.gitlab.com/tozd/docker/meteor-testing`](https://gitlab.com/tozd/docker/meteor-testing/container_registry)

## Description

A Docker image which includes everything necessary to test [Meteor](https://www.meteor.com/) apps in CI:

* All Meteor versions, one Docker image per version, for reproducible builds.
* A fixed version of Chromium and its chromedriver (72.0.3626.121).
* Xvfb.
* Selenium webdriver 3.6.0.

Simply use it together with your Meteor app and then run your
`meteor test --full-app` or any other testing command.
