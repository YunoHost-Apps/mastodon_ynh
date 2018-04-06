#!/bin/bash

# Create a db without password
#
# usage: ynh_mysql_create_user user
# | arg: user - the user name to create
ynh_psql_create_db_without_password() {
	db=$1
    sudo su -c "psql" postgres <<< \
    "CREATE USER $db CREATEDB;"
}

# Create a user
#
# usage: ynh_mysql_create_user user pwd [host]
# | arg: user - the user name to create
# | arg: pwd - the password to identify user by
ynh_psql_create_user() {
        sudo su -c "psql" postgres <<< \
        "CREATE USER ${1} WITH PASSWORD '${2}';"
}

# Create a user without password
#
# usage: ynh_mysql_create_user user pwd [host]
# | arg: user - the user name to create
ynh_psql_create_user_without_password() {
        sudo su -c "psql" postgres <<< \
        "CREATE USER ${1};"
}

# Create a database and grant optionnaly privilegies to a user
#
# usage: ynh_mysql_create_db db [user [pwd]]
# | arg: db - the database name to create
# | arg: user - the user to grant privilegies
# | arg: pwd - the password to identify user by
ynh_psql_create_db() {
    db=$1
    # grant all privilegies to user
    if [[ $# -gt 1 ]]; then
        ynh_psql_create_user ${2} "${3}"
        sudo su -c "createdb -O ${2} $db" postgres
    else
        sudo su -c "createdb $db" postgres
    fi

}

# Drop a role
#
# usage: ynh_mysql_drop_role db
# | arg: db - the database name to drop
ynh_psql_drop_role() {
	sudo su -c "psql" postgres <<< \
	"DROP ROLE ${1};"
}

# Drop a database
#
# usage: ynh_mysql_drop_db db
# | arg: db - the database name to drop
ynh_psql_drop_db() {
    sudo su -c "dropdb ${1}" postgres
}

# Drop a user
#
# usage: ynh_mysql_drop_user user
# | arg: user - the user name to drop
ynh_psql_drop_user() {
    sudo su -c "dropuser ${1}" postgres
}
