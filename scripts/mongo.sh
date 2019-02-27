#!/usr/bin/env bash

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80  --keyserver-options http-proxy=http://wwwproxy:3128 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

/vagrant/scripts/update_upgrade_remove_clean.sh

apt-get install -y mongodb-org

service mongod stop

cp /vagrant/configs/mongod.conf /etc/mongod.conf

service mongod start