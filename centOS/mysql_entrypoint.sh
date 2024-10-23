#!/bin/bash
chown -R mysql:mysql /var/lib/mysql/
chown mysql:mysql /usr/sbin/mysqld
echo user=mysql>> /etc/my.cnf.d/mysql-server.cnf
MYPASSWORDTEMP=`cat /var/log/mysqld.log | grep 'password is generated' | awk '{print $NF}'`
echo $MYPASSWORDTEMP
mysql -u root -p$MYPASSWORDTEMP -e "alter user user( ) identified by '123456789';" --connect-expired-password
mysql -u root -p'123456789' -e "update mysql.user set host='%' where user='root'"
mysql -u root -p'123456789' -e "flush privileges;"
