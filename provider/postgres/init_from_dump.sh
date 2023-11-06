export PGPASSWORD=admin
psql -f /docker-entrypoint-initdb.d/dump.out -U admin -w
