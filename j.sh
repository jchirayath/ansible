#!/bin/bash

echo "hello world"
INTERFACE=eth0
CERTFILE=/root/certs/centos100.p12
CERTKEY=/root/certs/centos100.p12
KEYPASS=Ebay123!

nmcli connection add \
ifname $INTERFACE \
type ethernet \
connection.id wired-ebay-corp \
802-1x.eap tls \
802-1x.identity host/$HOSTNAME \
802-1x.client-cert $CERTFILE \
802-1x.private-key $CERTKEY \
802-1x.private-key-password $KEYPASS \
connection.autoconnect yes

