#!/bin/sh

# Fix to bypass incinga2 daemon on demand
case "$1" in
        *sh)
                exec "$@"
                exit 1
        ;;
esac

# Fix for icinga2 daemon to run from startup script
mkdir /var/run/icinga2
chmod 777 /var/run/icinga2

# Fix to populate external volume on first startup
if [ ! -f /etc/icinga2/icinga2.conf ]; then 
	echo "Empty config dir. Initializing..."
	cp -a /etc/icinga2_orig/* /etc/icinga2/
fi
if [ ! -f /etc/icingaweb2/setup.token ]; then
        echo "Empty config dir. Initializing..."
        cp -a /etc/icingaweb2_orig/* /etc/icingaweb2/
	icingacli setup token create
	chown :www-data /etc/icingaweb2/setup.token
fi


# Run icinga2 daemon in foreground mode
icinga2 api setup

service apache2 start
/etc/init.d/icinga2 foreground
