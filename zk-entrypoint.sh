#! /bin/bash

# Credit to Phunt
# KDC master key is "kerberos" - don't use for production! dev/test only.
/usr/sbin/kdb5_util -P kerberos create -s

/etc/rc.d/init.d/krb5kdc restart
/etc/rc.d/init.d/kadmin restart

cd /opt/zookeeper-3.5.2-alpha/conf

kadmin.local <<EOF
addprinc -randkey zookeeper/localhost@EXAMPLE.COM
addprinc -randkey zookeeper-client@EXAMPLE.COM
xst -k zookeeper.keytab zookeeper/localhost@EXAMPLE.COM
xst -k zookeeper-client.keytab zookeeper-client@EXAMPLE.COM
exit
EOF

cd /opt/zookeeper-3.5.2-alpha

# Set up our own krb5.conf
mv /root/krb5.conf /etc/krb5.conf

# Start ZooKeeper
./bin/zkServer.sh start-foreground

