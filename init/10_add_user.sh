#!/bin/bash


PUID=${PUID:-911}
PGID=${PGID:-911}

if [ ! "$(id -u ash)" -eq "$PUID" ]; then usermod -o -u "$PUID" ash ; fi
if [ ! "$(id -g ash)" -eq "$PGID" ]; then groupmod -o -g "$PGID" ash ; fi

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
GID/UID
-----------------------------------
User uid:    $(id -u ash)
User gid:    $(id -g ash)
-----------------------------------
"
chown ash:ash /app
chown ash:ash /config
