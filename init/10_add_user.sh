#!/bin/bash

# default to Mac OS X user/group
PUID=${PUID:-501}
PGID=${PGID:-20}

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
"

echo "==> Setting permissions on default volumes"
chown ash:ash /backups /config /defaults /src
echo "-----> Done!"
