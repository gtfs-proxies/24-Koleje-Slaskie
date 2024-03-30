#!/bin/bash

# RELEASE_DATE=$(./get-release-date.sh)
RELEASE_URL=$(./get-release-url.sh)
if [ -f wget_options ]; then
    WGET_OPTIONS=$(cat wget_options)
fi
mkdir -p /tmp/$FEED_NAME/original/
wget -cN -v $WGET_OPTIONS $RELEASE_URL -P /tmp/$FEED_NAME/original/