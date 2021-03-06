#/!bin/bash

cd ../bench
./bench -all-addresses 127.0.0.11 -target 127.0.0.11:443 -tls -jia-service-url http://127.0.0.1:4999

cd ../webapp
sudo cp /var/log/nginx/access.log logs/access.log
sudo chmod 777 logs/access.log
sudo cp /var/log/mysql/mariadb-slow.log logs/mariadb-slow.log
sudo chmod 777 logs/mariadb-slow.log
