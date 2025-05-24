FROM odoo:16.0

# Imposta ambiente SQLite
ENV ODOO_RC /etc/odoo/odoo.conf
RUN echo "[options]" > $ODOO_RC && \
    echo "db_host = False" >> $ODOO_RC && \
    echo "db_user = False" >> $ODOO_RC && \
    echo "db_password = False" >> $ODOO_RC && \
    echo "db_name = odoo.db" >> $ODOO_RC && \
    mkdir -p /var/lib/odoo && chown odoo /var/lib/odoo

# Avvio diretto senza parametri superflui
CMD ["python3", "/usr/bin/odoo"]
