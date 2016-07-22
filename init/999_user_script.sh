#!/bin/bash

if [ ! -z "$USER_SCRIPT" ]; then
    echo "==> Attempting to run user-provided script"
    if [ -f /config/user_script.sh -a -x /config/user_script.sh ]; then
        echo "-----> User-provided script found..."
        echo "-----> Running user-provided script..."
        /config/user_script.sh
        echo "-----> Done!"
    else
        echo "-----> No user-provided script found."
    fi
fi
exit 0
