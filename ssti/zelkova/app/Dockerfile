FROM debian:bullseye-slim

RUN sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian |archive.debian.org/debian |g; /-updates/d; /-backports/d' /etc/apt/sources.list

RUN apt-get update --allow-releaseinfo-change && apt-get install -y apache2 \
    libapache2-mod-wsgi-py3 \
    python3 \
    python3-pip \
    curl \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY ./website/requirements.txt /var/www/ssti_include_loan_calculator/app/requirements.txt
RUN pip install --no-cache-dir -r /var/www/ssti_include_loan_calculator/app/requirements.txt

COPY ./ssti_include_loan_calculator-httpd.conf /etc/apache2/sites-available/ssti_include_loan_calculator-httpd.conf
COPY ./website/ssti_include_loan_calculator.wsgi /var/www/ssti_include_loan_calculator/
COPY ./website/run.py /var/www/ssti_include_loan_calculator/
COPY ./website/app /var/www/ssti_include_loan_calculator/app

RUN --mount=type=secret,id=flag sh -c 'cat /run/secrets/flag > /flag && chmod 644 /flag'

RUN chown -R www-data:www-data /var/www/ssti_include_loan_calculator/
RUN chmod -R 755 /var/www/ssti_include_loan_calculator/

RUN a2dissite 000-default.conf
RUN a2ensite ssti_include_loan_calculator-httpd.conf
RUN a2enmod headers

CMD /usr/sbin/apache2ctl -D FOREGROUND
