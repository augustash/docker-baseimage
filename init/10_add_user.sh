#!/bin/bash

# default to initial Mac OS X user/group
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

-----------------------------------
Container UID:    $(id -u ash)
Container GID:    $(id -g ash)
-----------------------------------
"

echo "==> Setting permissions on default volumes"
chown ash:ash /config /defaults /src
echo "-----> Done!"
