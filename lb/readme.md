# Error 
Client does not support authentication protocol requested by server; consider upgrading MySQL client
 Fix => 
ALTER USER 'haproxy_check'@'%' IDENTIFIED WITH mysql_native_password BY '';


# handle Failover replica
- Split connect into 2 part :  read and write operation
- Haproxy health_check




