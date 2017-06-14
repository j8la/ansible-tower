#!/bin/bash

# Generate password for database
hash=$(date | sha256sum)
pass=${hash::-3}

# Generate tower iventory
cat >/opt/ansible-tower/inventory <<EOL
[tower]
localhost ansible_connection=local

[database]

[all:vars]
admin_password='password'

pg_host=''
pg_port=''

pg_database='awx'
pg_username='awx'
pg_password='${pass}'

rabbitmq_port=5672
rabbitmq_vhost=tower
rabbitmq_username=tower
rabbitmq_password='${pass}'
rabbitmq_cookie=rabbitmqcookie
rabbitmq_use_long_name=false
EOL

# Save password in file for read
cat >/opt/ansible-tower-password <<EOL
${pass}
EOL

chmod 700 /opt/ansible-tower-password
chmod 700 /opt/ansible-tower/inventory

# Locales for postgres failed execution in tower install
cat >/etc/default/locale <<EOL
LANG=en_US.UTF-8
LANGUAGE=
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=en_US.UTF-8
EOL

locale-gen en_US.UTF-8
dpkg-reconfigure locales
update-locale