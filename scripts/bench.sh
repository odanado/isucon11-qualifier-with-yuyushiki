#/!bin/bash

../bench/bench -all-addresses 127.0.0.11 -target 127.0.0.11:443 -tls -jia-service-url http://127.0.0.1:4999
cp /var/log/nginx/access.log logs/access.log
cp /var/log/mysql/mariadb-slow.log logs/mariadb-slow.log
