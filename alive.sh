#!/bin/sh
# Report metric
echo "compile.running:`docker ps | grep particle | wc -l`|c" | nc -u -w1 $HOST_IP 8125