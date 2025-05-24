#!/bin/bash
set -e

# Test connessione database (debug)
echo "Testing DB connection..."
PGPASSWORD="$DB_PASSWORD" psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "\conninfo" || exit 1

# Avvia Odoo SENZA spazi tra parametri
exec python3 /usr/bin/odoo \
  --http-interface="${HOST:-0.0.0.0}" \
  --http-port="${PORT:-8069}" \
  --database="$DB_NAME" \
  --db_host="$DB_HOST" \
  --db_port="$DB_PORT" \
  --db_user="$DB_USER" \
  --db_password="$DB_PASSWORD"
