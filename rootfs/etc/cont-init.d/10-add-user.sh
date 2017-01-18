#!/usr/bin/with-contenv bash

# default to MacOS user/group
PUID=${PUID:-501}
PGID=${PGID:-20}

if [ ! "$(id -g ash)" -eq "$PGID" ]; then groupmod -o -g "$PGID" ash ; fi
if [ ! "$(id -u ash)" -eq "$PUID" ]; then usermod -o -u "$PUID" ash ; fi

echo "
-----------------------------------
User UID/GID: $(id -u ash) / $(id -g ash)
-----------------------------------
"
