#!/bin/bash

# Getting the Interface name
INTERFACE=eth0
echo "Getting Interface Name"
INTERFACE=`nmcli dev| grep ethernet | awk '{print $1}'`
echo "Detected Interface $INTERFACE"

CERTFILE=/etc/certs/mycert.p12
CERTKEY=/etc/certs/mycert.p12
KEYPASS=Ebay123!

nmcli connection add \
ifname $INTERFACE \
type ethernet \
-- \
connection.id wired-ebay-corp \
802-1x.eap tls \
802-1x.identity host/$HOSTNAME \
802-1x.client-cert $CERTFILE \
802-1x.private-key $CERTKEY \
802-1x.private-key-password $KEYPASS \
connection.autoconnect yes

