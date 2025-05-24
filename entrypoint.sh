#!/bin/bash
set -e

# Copia i file di configurazione (ignora errori se già esistenti)
cp /custom-entrypoint/odoo.conf /etc/odoo/ 2>/dev/null || true
cp /custom-entrypoint/wait-for-psql.py /usr/local/bin/ 2>/dev/null || true

# Avvia Odoo con parametri espliciti
exec python3 /usr/bin/odoo \
  --http-port=${PORT:-8069} \
  --db_host=${DB_HOST:-False} \
  --db_port=${DB_PORT:-False} \
  --db_user=${DB_USER:-odoo} \
  --db_password=${DB_PASSWORD:-False} \
  --addons-path=${ADDONS_PATH:-/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons}
