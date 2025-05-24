FROM odoo:16.0

# Copia i file come utente root
COPY --chown=odoo:odoo entrypoint.sh /tmp/
COPY --chown=odoo:odoo odoo.conf /tmp/
COPY --chown=odoo:odoo wait-for-psql.py /tmp/

# Imposta i permessi prima di spostare i file
RUN chmod +x /tmp/entrypoint.sh && \
    mv /tmp/entrypoint.sh / && \
    mv /tmp/odoo.conf /etc/odoo/ && \
    mv /tmp/wait-for-psql.py /usr/local/bin/
