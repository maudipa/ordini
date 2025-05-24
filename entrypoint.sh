#!/bin/bash
set -e

# Copia configurazione solo se non esiste
[ ! -f /etc/odoo/odoo.conf ] && cp /custom-config/odoo.conf /etc/odoo/

# Avvia Odoo con parametri espliciti
exec python3 /usr/bin/odoo \
  --http-interface=${HOST:-0.0.0.0} \
  --http-port=${PORT:-8069} \
  --database=${DB_NAME:-odoo} \
  --db_host=${DB_HOST:-db} \
  --db_user=${DB_USER:-odoo} \
  --db_password=${DB_PASSWORD:-odoo}
