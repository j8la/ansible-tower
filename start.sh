#!/bin/bash

trap 'shut_down' SIGINT SIGTERM SIGKILL

shut_down(){
    ansible-tower-service stop
    exit 0
}

ansible-tower-service start &
pid=$!
sleep inf & wait
