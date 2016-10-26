#!/bin/bash

hash=$(date | sha256sum)
pass=${hash::-3}

cat >/opt/ansible-tower/inventory <<EOL
[primary]
localhost ansible_connection=local

[secondary]

[database]

[all:vars]
admin_password='password'
redis_password='${pass}'

pg_host=''
pg_port=''

pg_database='awx'
pg_username='awx'
pg_password='${pass}'
EOL

cat >/opt/ansible-tower-password <<EOL
${pass}
EOL

chmod 700 /opt/ansible-tower-password
chmod 700 /opt/ansible-tower/inventory

