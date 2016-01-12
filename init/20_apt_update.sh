#!/bin/bash

if [ -z ${SKIP_UPDATE+x} ]; then
    [ "$BASE_APTLIST" ] && APTLIST="$BASE_APTLIST ""$APTLIST"
    [ "$APTLIST" ] && (echo "Now refreshing packages from apt repositories, this *may* take a while" && apt-get -yqq update && apt-get -yqq --only-upgrade install $APTLIST)
    sleep 1s
fi
