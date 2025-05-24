#!/bin/bash
set -e

# Copia i file nelle posizioni finali (con sudo se necessario)
cp /custom-entrypoint/odoo.conf /etc/odoo/ || true
cp /custom-entrypoint/wait-for-psql.py /usr/local/bin/ || true

# Esegui Odoo
exec python3 /usr/bin/odoo "$@"
