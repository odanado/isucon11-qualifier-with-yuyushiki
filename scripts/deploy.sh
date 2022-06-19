#/!bin/bash

set -eux

git pull origin `git symbolic-ref --short HEAD`

cp env.sh /home/isucon/env.sh

# --- app ---
pushd nodejs

npm ci
npm run build

popd

sudo systemctl restart isucondition.nodejs.service

# --- nginx ---

sudo rm -f /var/log/nginx/access.log
sudo rm -f /var/log/nginx/error.log

sudo cp config/nginx-primary/nginx.conf /etc/nginx/nginx.conf
sudo cp config/nginx-primary/isucondition.conf /etc/nginx/sites-available/isucondition.conf

sudo systemctl restart nginx.service

# --- MariaDB ---

sudo rm -f /var/log/mysql/mariadb-slow.log
sudo cp config/mysql/my.cnf /etc/mysql/my.cnf
sudo cp -r config/mysql/conf.d/ /etc/mysql/conf.d/
sudo cp -r config/mysql/mariadb.conf.d/ /etc/mysql/mariadb.conf.d/

sudo systemctl restart mysql.service
