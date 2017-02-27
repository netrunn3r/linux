#!/bin/bash

sudo su<<END
pkill wpa
ip l set wlp3s0 up
wpa_supplicant -i wlp3s0 -c <(wpa_passphrase $1 $2) &
sleep 2
dhclient -v wlp3s0
END
