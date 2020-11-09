# tozd/meteor-testing

<https://gitlab.com/tozd/docker/meteor-testing>

Available as:

* [`tozd/meteor-testing`](https://hub.docker.com/r/tozd/meteor-testing)
* [`registry.gitlab.com/tozd/docker/meteor-testing`](https://gitlab.com/tozd/docker/meteor-testing/container_registry)

## Description

A Docker image which includes everything necessary to test [Meteor](https://www.meteor.com/) apps in CI:

* Latest version of Meteor itself.
* Chromium and its chromedriver.
* Xvfb.
* Selenium webdriver.

Simply use it together with your Meteor app and then run your
`meteor test --full-app` or any other testing command.
