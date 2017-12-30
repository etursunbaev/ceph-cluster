#!/bin/bash
# Deplow new cluster:
ceph-deploy new osd1 osd2 osd3

# Installing Ceph on nodes:
ceph-deploy install osd1 osd2 osd3

# Installing monitors on each nodes:
ceph-deploy mon create-initial

# Preparing Disks
ceph-deploy disk zap {osd1,osd2,osd3}:{sdb,sdc,sdd}

# Creatting osd disks:
ceph-deploy osd create {osd1,osd2,osd3}:{sdb,sdc,sdd}