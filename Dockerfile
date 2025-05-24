FROM odoo:16.0
USER root
RUN mkdir -p /custom-config && chown odoo:odoo /custom-config
COPY --chown=odoo:odoo odoo.conf /custom-config/
COPY --chown=odoo:odoo entrypoint.sh /custom-config/
RUN chmod +x /custom-config/entrypoint.sh
USER odoo
ENTRYPOINT ["/custom-config/entrypoint.sh"]
