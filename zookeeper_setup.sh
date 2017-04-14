#!/bin/bash

ZOOKEEPER_VER="zookeeper-3.5.2-alpha"

mkdir -p /opt/$ZOOKEEPER_VER/data
touch /opt/$ZOOKEEPER_VER/data/myid
echo 1 > /opt/$ZOOKEEPER_VER/data/myid

