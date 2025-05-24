FROM odoo:16.0

# Crea cartella per il database SQLite
RUN mkdir -p /var/lib/odoo && chown odoo /var/lib/odoo

# Avvia Odoo in modalità super-semplice
CMD ["python3", "/usr/bin/odoo", \
    "--http-port=8069", \
    "--database=odoo.db", \
    "--db_host=False", \
    "--db_user=False", \
    "--db_password=False"]
