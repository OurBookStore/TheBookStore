#!/bin/bash

host="127.0.0.1"
port="5432"
username="postgres"
password="admin"
path="./postgres/dump.out"

print_usage() {
    echo "usage: $(basename "$0") save|help|restore"
}

save_db(){
    check_db=$(pg_isready -h "$host" -p "$port" -U "$username")

    if [[ $check_db != *"accepting"* ]]; then 
        echo "postgres not accepting connections on $host:$port"
        exit 1
    fi
    echo "Do you realy want to save current postgres state to docker image? (yes/no)" 
    read -r user_input

    if [[ $user_input != "yes" ]]; then 
        exit 0
    fi

    mv "$path" "$path".old
    gzip "$path".old

    export PGPASSWORD="$password"
    pg_dumpall -h "$host" -p "$port" -U "$username" -w > "$path" &&

    docker compose down -v
    docker compose up --build -d
    docker logs book_store_postgres
    docker logs book_store_keycloak
    docker ps 
}

restore_from_backup(){
    echo  "Do you realy want to load last version of db? (yes/no)" 
    read -r user_input

    if [[ $user_input != "yes" ]]; then 
        exit 0
    fi

    gzip -d "$path".old
    rm "$path"
    mv "$path".old "$path"

    docker compose down -v
    docker compose up --build -d
    docker logs book_store_postgres
    docker logs book_store_keycloak
    docker ps 
}


if [ $(( OPTIND )) -lt 1 ]; then
    print_usage
    exit 1
fi

ARG=${*:$OPTIND:1}

if [[ $ARG == "help" ]]; then 
    print_usage
    exit 0
fi

if [[ $ARG == "save" ]]; then 
    save_db
    exit 0
fi

if [[ $ARG == "restore" ]]; then 
    restore_from_backup
    exit 0
fi

print_usage
