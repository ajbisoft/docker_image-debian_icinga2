#!/bin/sh

case "$1" in
        *sh)
                exec "$@"
                exit 1
        ;;
esac

mkdir /var/run/icinga2
chmod 777 /var/run/icinga2
/etc/init.d/icinga2 foreground
