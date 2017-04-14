# ZooKeeper Dev/Test setup

Needed a docker container for developing a project of mine, however I could not find any good existing containers that had at least 3.5 + of ZooKeeper + Kerberos installed. In the end, I decided to make my own with ZooKeeper-3.5.2-alpha installed.

Took a lot of help by the docker setup Phunt has (https://github.com/phunt/zk-docker-devenv/tree/master/kerberos.centos.6.7).

Run
```
$ docker run -d --name zookeeper -p 2181:2181 meldrum/docker-zookeeper-kerberos
```


