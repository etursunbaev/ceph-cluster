# ceph-cluster

This is virtual test Ceph environment using Vagrant and Virtualbox.The main approach is to automate deploying ceph nodes with Ansible playbooks.

There are several nodes:

1. Ansible node. 
2. Three ceph monitors
3. Three osd nodes

Each osd node consists of 2048Mb of RAM, 1 CPU and 3 virtual disks with 50Gb size

Other nodes has 1024Mb of RAM and standart configuration


Inspired by this articles:

- https://habrahabr.ru/post/315646/ in russian
- http://onreader.mdl.ru/MasteringCeph/content/Ch02.html#01 in russian
- https://github.com/ceph/ceph-ansible

