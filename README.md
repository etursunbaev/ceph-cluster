# ceph-cluster
Ceph Storage Cluster deployments begin with setting up each Ceph Node, your network, and the Ceph Storage Cluster. A Ceph Storage Cluster requires at least one Ceph Monitor, Ceph Manager, and Ceph OSD (Object Storage Daemon). The Ceph Metadata Server is also required when running Ceph Filesystem clients.

This is simple test Ceph environment using Vagrant and Virtualbox.The main approach is to automate deploying ceph nodes with Ansible playbooks.


There are 4 nodes, 3 osd nodes with monitor daemons and 1 admin node to deploy Ceph cluster

Each osd node consists of 4096Mb of RAM and 1 virtual disks with 200Gb size

## Preparetion

- Set up Vagrantfile
 
     p.s. In physical environment prepare disks
- Prepare hosts file with ip and hostname. It is necessary for ceph-deploy utility and ansible to get connection by hostname.
- Generate SSH key and distribute it to each node. Ceph-deploy must login to node that has passwordless sudo privileges, because it needs to install software and configuration files without prompting for passwords. 

## Configuration

- On OSD nodes install NTP, NTPDATE (it is necessary for clock syncing between monitors daemon), TGTADM (Linux SCSI Target Administration Utility)
- On admin node install sshpass, ceph-deploy utility 
 
    p.s. in physical environment also install ansible to run playbooks

## Directions

1. run "time vagrant up"

P.S. 
`
ceph-deploy osd create
` 
shows an error, nevertheless ceph cluster works. Need to investigate and fix
Inspired by this articles:

- https://habrahabr.ru/post/315646/ in russian
- http://onreader.mdl.ru/MasteringCeph/content/Ch02.html#01 in russian
- https://github.com/ceph/ceph-ansible This source is ready and could be realized easily, but want to build own cluster 

