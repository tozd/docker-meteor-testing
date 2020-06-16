A Docker image which includes everything necessary to test [Meteor](https://www.meteor.com/) apps in CI:

* Latest version of Meteor itself.
* Chromium and its chromedriver.
* Xvfb.
* Selenium webdriver.

Simply use it together with your Meteor app and then run your
`meteor test --full-app` or any other testing command.
