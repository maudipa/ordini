FROM odoo:16.0

# Crea le directory necessarie con i permessi corretti
USER root
RUN mkdir -p /custom-entrypoint && \
    chown odoo:odoo /custom-entrypoint

# Copia i file come utente odoo
USER odoo
COPY --chown=odoo:odoo entrypoint.sh /custom-entrypoint/
COPY --chown=odoo:odoo odoo.conf /custom-entrypoint/
COPY --chown=odoo:odoo wait-for-psql.py /custom-entrypoint/

# Imposta l'entrypoint personalizzato
ENTRYPOINT ["/custom-entrypoint/entrypoint.sh"]
CMD ["odoo"]
