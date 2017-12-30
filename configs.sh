#!/bin/bash
sudo echo "
192.168.1.41 mon1
192.168.1.42 mon2
192.168.1.43 mon3
192.168.1.51 osd1
192.168.1.52 osd2
192.168.1.53 osd3" >> /etc/hosts
sudo echo "[mons]
mon1
mon2
mon3

[osds]
osd1
osd2
osd3

[ceph:children]
mons
osds" >> /etc/ansible/hosts