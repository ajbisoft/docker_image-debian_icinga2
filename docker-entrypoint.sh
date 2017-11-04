#!/bin/sh

case "$1" in
        *sh)
                exec "$@"
                exit 1
        ;;
esac

/etc/init.d/icinga2 foreground
