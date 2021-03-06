# Ansible Tower Docker Image

The image built to docker from this repository contains the 3.1.3 version of Ansible Tower and must be used for testing purposes. 

### How to
Pull & start :
```sh
# docker pull jbla/ansible-tower
# docker run -d -p 443:443 ansible-tower
```
Then connect to https://[IP] with the following account :
* Login : admin
* Password: password

To successfully stop the container without a 137 error code, increase the default timeout (10s) before the SIGKILL with :
```sh
# docker stop -t 30 [name]
```

### Passwords
The RabbitMQ & Postgres passwords are same and automatically generated from a SHA 256 random hash when building the image. You can find it with the following :
```sh
# docker exec [name] cat /opt/ansible-tower-password
```

### Get old versions
```sh
# docker pull jbla/ansible-tower:release-3.0.2
```

=====

Ansible, Ansible Tower & RedHat are trademarks of Red Hat, Inc.