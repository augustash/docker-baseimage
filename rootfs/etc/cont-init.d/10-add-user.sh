#!/usr/bin/with-contenv bash

# default to MacOS user/group
PUID=${PUID:-501}
PGID=${PGID:-20}

if [ ! "$(id -g ash)" -eq "$PGID" ]; then groupmod -o -g "$PGID" ash ; fi
if [ ! "$(id -u ash)" -eq "$PUID" ]; then usermod -o -u "$PUID" ash ; fi

echo "
-----------------------------------

      █████╗ ███████╗██╗  ██╗
     ██╔══██╗██╔════╝██║  ██║
     ███████║███████╗███████║
     ██╔══██║╚════██║██╔══██║
     ██║  ██║███████║██║  ██║
     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

       Built by August Ash
-----------------------------------
-----------------------------------
User UID:    $(id -u ash)
User GID:    $(id -g ash)
-----------------------------------
"

chown -R ash:ash \
    /backups \
    /config \
    /defaults \
    /src
