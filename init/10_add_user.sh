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
User UID:    $(id -u ash)
User GID:    $(id -g ash)
-----------------------------------
"
