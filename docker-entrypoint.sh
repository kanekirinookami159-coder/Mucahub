#!/bin/bash
set -e

PORT=${PORT:-80}

# Replace Apache listen port
if [ -f /etc/apache2/ports.conf ]; then
  sed -ri "s/Listen [0-9]+/Listen ${PORT}/g" /etc/apache2/ports.conf
fi

# Replace VirtualHost port in site configs
for f in /etc/apache2/sites-available/*.conf; do
  [ -f "$f" ] || continue
  sed -ri "s/<VirtualHost \*:[0-9]+>/<VirtualHost *:${PORT}>/g" "$f"
done

exec "$@"
