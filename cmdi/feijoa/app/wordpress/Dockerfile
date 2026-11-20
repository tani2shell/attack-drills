FROM wordpress:latest
COPY . /var/www/html
RUN --mount=type=secret,id=flag sh -c 'cat /run/secrets/flag > /opt/flag.txt && chmod 644 /opt/flag.txt'
RUN chown -R www-data:www-data /var/www/html
# container apache must also listen on 19033 or every plugin-file save rolls back ("No se puede comunicar")
RUN echo 'Listen 19033' >> /etc/apache2/ports.conf