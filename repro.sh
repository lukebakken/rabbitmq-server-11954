#!/usr/bin/env bash

docker run --rm --name rabbitmq-server-11954 rabbitmq:3-management &

while :
do
    docker exec --user 999:999 rabbitmq-server-11954 /bin/sh -c 'rabbitmq-diagnostics -q check_running; ls -la /var/lib/rabbitmq'
    sleep 0.2

    # Note: when running this version, the erlang cookie is created by the root user:
    # 
    # drwxrwxrwt 2 rabbitmq rabbitmq 4096 Aug  8 15:35 .
    # drwxr-xr-x 1 root     root     4096 Apr 25 22:51 ..
    # -r-------- 1 root     root       20 Aug  8 00:00 .erlang.cookie
    #
    # docker exec rabbitmq-server-11954 /bin/sh -c 'rabbitmq-diagnostics -q check_running; ls -la /var/lib/rabbitmq'
done
