#!/bin/bash
set -e

GLPI_DB_HOST="${GLPI_DB_HOST:-db}"

echo "Waiting for database on ${GLPI_DB_HOST}:3306..."
for i in $(seq 1 60); do
  nc -z "$GLPI_DB_HOST" 3306 && break
  sleep 1
done

echo "Waiting for Redis on redis:6379..."
for i in $(seq 1 30); do
  nc -z redis 6379 && break
  sleep 1
done

chown -R www-data:www-data /var/www/html/files /var/www/html/config
chmod -R 755 /var/www/html/files
chmod -R 775 /var/www/html/config

exec apache2-foreground
