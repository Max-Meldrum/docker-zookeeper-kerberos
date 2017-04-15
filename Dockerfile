FROM centos:6.7

RUN yum clean all

RUN yum install -y \
 krb5-server krb5-libs \
 krb5-workstation \
 java-1.8.0-openjdk-headless \
 wget \
 tar 

RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.5.2-alpha/zookeeper-3.5.2-alpha.tar.gz | tar -xzf - -C /opt
ADD ./jaas.conf /opt/zookeeper-3.5.2-alpha/conf/jaas.conf
ADD ./zoo.cfg /opt/zookeeper-3.5.2-alpha/conf/zoo.cfg
ADD ./java.env /opt/zookeeper-3.5.2-alpha/conf/java.env

ADD ./zookeeper_setup.sh /root/zookeeper_setup.sh
ADD ./krb5.conf /root/krb5.conf

# Set up ZooKeeper
RUN ./root/zookeeper_setup.sh

WORKDIR /opt/zookeeper-3.5.2-alpha
ADD ./zk-entrypoint.sh .

EXPOSE 2181 88/udp 88/tcp 749
RUN yum clean all

ENTRYPOINT ["./zk-entrypoint.sh"]
