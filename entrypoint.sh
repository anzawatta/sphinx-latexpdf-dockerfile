#!/bin/bash

if [ -r /docs/requirements.txt ]; then
  pip3 install -r /docs/requirements.txt
fi

exec "$@"
