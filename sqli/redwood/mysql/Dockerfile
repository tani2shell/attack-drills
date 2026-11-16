FROM mysql:8.0
ARG FLAG
# build-portability fix: the flag is sed-substituted into backup.sql at build time
# (below), so the upstream ENV FLAG is dropped — nothing reads it at runtime and a
# leftover ENV would leak the flag through `docker inspect`.
COPY backup.sql /docker-entrypoint-initdb.d/
RUN sed -i "s/\${FLAG}/${FLAG}/g" /docker-entrypoint-initdb.d/backup.sql