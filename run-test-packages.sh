#!/bin/bash
#
# Based on: https://github.com/meteor/meteor/blob/devel/packages/test-in-console/run.sh

export URL='http://localhost:4096/'

exec 3< <(meteor test-packages --driver-package test-in-console --once -p 4096 ./)
EXEC_PID=$!

sed '/test-in-console listening$/q' <&3

node /puppeteerRunner.js

STATUS=$?

pkill -TERM -P $EXEC_PID
exit $STATUS
