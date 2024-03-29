#!/bin/bash

#
# get URL to download latest GTFS feed
#
let CURRENT_YEAR=$(date +%Y)
let NEXT_YEAR=CURRENT_YEAR+1
RELEASE_URL=https://koleje-ks.pl/gtfs/$CURRENT_YEAR-$NEXT_YEAR.zip

curl -sIfo /dev/null $RELEASE_URL

while [ $? -ne 0 ]
do
    if [ $CURRENT_YEAR -le 2000 ]
    then
        RELEASE_URL=
        break
    fi
    let CURRENT_YEAR--
    let NEXT_YEAR--
    RELEASE_URL=https://koleje-ks.pl/gtfs/$CURRENT_YEAR-$NEXT_YEAR.zip
    curl -sIfo /dev/null $RELEASE_URL
done

if [ -n "$RELEASE_URL" ]
then
    echo $RELEASE_URL
fi
