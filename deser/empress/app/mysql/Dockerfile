FROM mysql:5.7.15

ENV MYSQL_ROOT_PASSWORD=password

ADD init.sql /docker-entrypoint-initdb.d/
RUN --mount=type=secret,id=flag sh -c 'sed -i s/FLAG_PLACEHOLDER/$(cat /run/secrets/flag)/g /docker-entrypoint-initdb.d/init.sql'

EXPOSE 3306