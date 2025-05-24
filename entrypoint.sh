#!/bin/bash
set -e

# Valori di default
DEFAULT_PORT=8069
DEFAULT_DB_PORT=5432  # <-- AGGIUNGI QUESTO

# Attendi PostgreSQL se configurato
if [ -n "$DB_HOST" ]; then
  echo "Waiting for PostgreSQL at ${DB_HOST}:${DB_PORT:-$DEFAULT_DB_PORT}..."
  until pg_isready -h "$DB_HOST" -p "${DB_PORT:-$DEFAULT_DB_PORT}" -U "$DB_USER"; do
    sleep 1
  done
fi

# Avvia Odoo con parametri validati
exec python3 /usr/bin/odoo \
  --http-interface="${HOST:-0.0.0.0}" \
  --http-port="${PORT:-$DEFAULT_PORT}" \
  --database="${DB_NAME:-odoo}" \
  --db_host="${DB_HOST:-db}" \
  --db_port="${DB_PORT:-$DEFAULT_DB_PORT}" \  # <-- GARANTISCE UN NUMERO VALIDO
  --db_user="${DB_USER:-odoo}" \
  --db_password="${DB_PASSWORD:-odoo}"
