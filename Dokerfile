FROM odoo:16.0
COPY entrypoint.sh /
COPY odoo.conf /etc/odoo/
COPY wait-for-psql.py /usr/local/bin/
RUN chmod +x /entrypoint.sh
