# Ansible Tower Docker Image

The image built to docker from this repository contains the 3.0.2 version of Ansible Tower and must be used for testing purposes. 

### How to
Pull & start :
```sh
# docker pull jbla/ansible-tower
# docker run -d -p 8080:8080 -p 443:443 ansible-tower
```
Then connect to https://[IP] with the following account :
* Login : admin
* Password: password

### Passwords
The Redis and Postgres passwords are same and automatically generated from a SHA 256 random hash when building the image. You can find it with the following :
```sh
# docker exec [image] cat /opt/ansible-tower-password
```

=====

Ansible, Ansible Tower & RedHat are trademarks of Red Hat, Inc.