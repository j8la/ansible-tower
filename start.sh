#!/bin/bash

trap 'shut_down' SIGINT SIGTERM SIGKILL

shut_down(){
    service ssh stop
    ansible-tower-service stop
    exit 0
}

service ssh start
ansible-tower-service start &
pid=$!
sleep inf & wait
