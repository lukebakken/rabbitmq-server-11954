#!/usr/bin/env bash

docker run --rm --name rabbitmq-server-11954 rabbitmq:3-management &

while :
do
    docker exec --user 999:999 rabbitmq-server-11954 rabbitmq-diagnostics -q check_running
    sleep 0.2
done
