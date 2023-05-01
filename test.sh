#!/bin/sh

set -e

METEOR_VERSION="${TAG##*-}"

installed_version="$(docker run --rm "${CI_REGISTRY_IMAGE}:${TAG}" meteor --version | tail -n 1)"
if [ "$installed_version" != "Meteor ${METEOR_VERSION}" ]; then
  echo "Error: $installed_version is installed, wanted ${METEOR_VERSION}"
  exit 1
fi
