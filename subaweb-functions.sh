#! /bin/sh

subaweb_create_db_volume() {
    docker volume create --name vc_subaweb_db || return 1
    return 0
}

subaweb_delete_db_volume() {
    docker volume rm vc_subaweb_db || return 1
    return 0
}

subaweb_mysql_up() {

    docker-compose up -d joomladb || return 1

    n="0"

    while [ $n -lt 60 ]
    do
        # try to access a database to know if mysql has indeed started
        docker run -i --rm \
            -v vc_subaweb_db:/var/lib/mysql \
            --net dockersubaweb_default \
            mysql:5.6 \
            mysql -uroot -hjoomladb -pjuges3:sud -e "use mysql" 
        if [ $? -eq 0 ]; then
            echo "datedb is up after $n attempts"
            return 0
        else
            sleep 1
        fi
        n=$[$n+1]
    done

    return 1

}

subaweb_populate_db() {

    subaweb_mysql_up || return 1

    sqlsourcefile=${1:-backup-jlabo-23092016.sql}

    docker run -i --rm -v vc_subaweb_db:/var/lib/mysql \
        --net dockersubaweb_default \
        -v $(pwd):/sqlsource \
        mysql:5.6 \
        mysql -uroot -hjoomladb -pjuges3:sud <<EOF
    create database if not exists jlabo;
    connect jlabo;
    source /sqlsource/$sqlsourcefile
EOF

    docker-compose down

    return 0
}

subaweb_bootstrap() {

    subaweb_delete_db_volume || return 1
    subaweb_create_db_volume || return 1
    subaweb_populate_db || return 1

}
