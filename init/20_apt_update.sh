#!/bin/bash

# exit if updates shouldn't be run
[ "$SKIP_UPDATE" ] && exit 0
[ "$BASE_APTLIST" ] && APTLIST="$BASE_APTLIST ""$APTLIST"
[ "$APTLIST" ] || exit 0

# check and install available updates
echo "==> Refreshing packages from APT repos, this *may* take a while"
apt-get -yqq update && apt-get -yqq --only-upgrade install $APTLIST
echo "-----> Done!"
