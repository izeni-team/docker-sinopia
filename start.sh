#!/bin/bash
if [ ! -f config.yaml ]; then
  cp /tmp/config.yaml /opt/sinopia/config.yaml
fi
cat /opt/sinopia/config.yaml
exec node /opt/sinopia/node_modules/sinopia/bin/sinopia --config /opt/sinopia/config.yaml
