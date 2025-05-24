#!/bin/bash
set -e

# Attendi che PostgreSQL sia pronto (solo se DB_HOST è definito)
if [ -n "$DB_HOST" ]; then
  echo "Waiting for PostgreSQL to be ready..."
  until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER"; do
    sleep 1
  done
fi

# Avvia Odoo
exec python3 /usr/bin/odoo \
  --http-interface="${HOST:-0.0.0.0}" \
  --http-port="${PORT:-8069}" \
  --database="$DB_NAME" \
  --db_host="$DB_HOST" \
  --db_port="$DB_PORT" \
  --db_user="$DB_USER" \
  --db_password="$DB_PASSWORD"
