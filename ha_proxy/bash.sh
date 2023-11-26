#!/bin/sh
chmod 400 /etc/mysql/conf.d/my.cnf
chmod 755 ./bash.sh
DB_USER="root"
DB_PASSWORD="1234qwer"

# New user parametersr
NEW_USERNAME="replica_set"
NEW_PASSWORD="1234qwer"

# MySQL query to create a new user
MYSQL_QUERY="CREATE USER 'replica_set'@'localhost' IDENTIFIED BY '1234qwer'; GRANT ALL PRIVILEGES ON mydatabase.* TO '$NEW_USERNAME'@'localhost'; FLUSH PRIVILEGES;"

echo $MYSQL_QUERY >> log.txt
# Execute the MySQL query
mysql -h localhost -u root  --port 3306 -p1234qwer -e"$MYSQL_QUERY"

