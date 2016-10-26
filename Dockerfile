FROM ubuntu:14.04

MAINTAINER Julien Blanc <jbla@tuta.io>

ENV ANSIBLE_TOWER_VER 3.0.2
EXPOSE 443 8080

RUN apt-get update \
    && yes | apt-get install software-properties-common \
    && yes | apt-add-repository ppa:ansible/ansible \
    && apt-get update \
    && yes | apt-get install ansible \
    && yes | apt-get install wget

WORKDIR /opt

RUN wget https://releases.ansible.com/awx/setup/ansible-tower-setup-${ANSIBLE_TOWER_VER}.tar.gz
RUN tar xvzf ansible-tower-setup-${ANSIBLE_TOWER_VER}.tar.gz \
    && rm -rf ansible-tower-setup-${ANSIBLE_TOWER_VER}.tar.gz \
    && mv ansible-tower-setup-${ANSIBLE_TOWER_VER} /opt/ansible-tower

ADD start.sh start.sh
ADD inventory.sh /opt/ansible-tower/inventory.sh
ADD config_dynamic.yml /opt/ansible-tower/roles/config_dynamic/tasks/main.yml

RUN chmod +x start.sh
RUN chmod +x inventory.sh
RUN /opt/ansible-tower/inventory.sh
RUN /opt/ansible-tower/setup.sh \
    && rm -rf /opt/ansible-tower

ENTRYPOINT exec /opt/start.sh