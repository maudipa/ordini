FROM odoo:15.0

CMD ["python3", "/usr/bin/odoo", \
    "--http-port=8069", \
    "--database=odoo.db", \
    "--db_host=False", \
    "--db_user=False", \
    "--db_password=False"]
