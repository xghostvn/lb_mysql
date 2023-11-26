#For Master

#step 1 :
- Create user for slave :
  create user 'replica_user'@'host_ip_slave' IDENTIFIED WITH mysql_native_password BY '1234qwer';
  or  create user 'replica_user'@'%' IDENTIFIED WITH mysql_native_password BY '1234qwer';
  opts "%"  => for all host
  GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%'; => grant permission to specific database for slave using .
  FLUSH PRIVILEGES; => after grant permission , then refresh
#step 2 :
- show status \G   => master_log_file and master_log_pos  using for slave config will get from here

# Config slave
- stop slave;
- Change master to master_host="172.26.0.2",master_user="replica_user",master_password="1234qwer",master_log_file="binlog.000002",master_log_pos=1881,get_master_publi
c_key=1;
- 
- start slave
- Check status slave : show slave status \G;


#Common Error
- Authentication plugin 'caching_sha2_password' reported error: Authentication requires secure connection : add opts : get_master_public_key = 1


#Extra
1. access denied root@localhost
  -- for MySQL
  ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

  -- for MariaDB
ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('root');


#Mysql common
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'new_password';
GRANT ALL ON my_db.* TO 'new_user'@'localhost'; => grant permission 
