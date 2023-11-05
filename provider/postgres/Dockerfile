FROM postgres:15.4

COPY ./dump.out /docker-entrypoint-initdb.d
COPY ./init_from_dump.sh /docker-entrypoint-initdb.d
