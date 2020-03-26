#!/usr/bin/env sh

UID=$(id -u)
GID=$(id -g)

updated=false

echo "Current UID : $UID"
echo "Current GID : $GID"

if [ "$UID" -ne 1000 ]; then
    echo "Updating www-data UID to $UID"
    usermod -u "$UID" www-data
    updated=true
fi

if [ "$GID" -ne 1000 ]; then
    echo "Updating www-data GID to $GID"
    usermod -g "$GID" www-data
    updated=true
fi

if [ "$updated" = true ]; then
    echo "Reapply folders ownership to www-data"
    chown www-data:www-data /var/www/html /home/www-data
fi

exec "${@}"
