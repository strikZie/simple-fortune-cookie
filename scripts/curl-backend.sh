#!/bin/sh

set -e

URL=${1:-"http://frontend:8080/healthz"}
TRIES=10
SLEEP=2

echo "Waiting for app"
for i in $(seq 1 "$TRIES"); do
    if curl --silent --fail "$URL" > /dev/null; then
        echo "App is responding"
        exit 0
    fi
    echo "Attempt $i/$TRIES failed, retrying in ${SLEEP}s..."
    sleep "$SLEEP"
done

echo "App did not respond after $TRIES attempts"
exit 1
