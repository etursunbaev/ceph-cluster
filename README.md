# ceph-cluster

This is virtual test Ceph environment using Vagrant and Virtualbox.The main approach is to automate deploying ceph nodes with Ansible playbooks.

There are 3 osd nodes

Each osd node consists of 2048Mb of RAM, 1 CPU and 3 virtual disks with 50Gb size

## Directions

1. run "vagrant up"
2. after "vagrant up" enter to one osd node "vagrant ssh $node_name"
3. in node generate ssh-key by "ssh-keygen"
<<<<<<< HEAD
3. than distribute ssh-key to each node by "ssh-copy-id $node_name"
4. than run playbook "ansible-playbook deploy.yml" or run script "deploy.sh" (playbooks are not ready and may not work)
=======
4. than distribute ssh-key to each node by "ssh-copy-id $node_name"
5. Copy deploy.sh and deploy.yml to connected node
6. than run playbook "ansible-playbook deploy.yml" or run script "deploy.sh" (playbooks are not ready and may not work)
>>>>>>> 2d3093eb22dde1da55964f154a413bb3a15e5137

Inspired by this articles:

- https://habrahabr.ru/post/315646/ in russian
- http://onreader.mdl.ru/MasteringCeph/content/Ch02.html#01 in russian
- https://github.com/ceph/ceph-ansible This source is ready and could be realized easily, but want to build own cluster 

