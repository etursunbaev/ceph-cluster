#!/bin/bash
apt-get update
apt-get install sshpass
ssh-keygen -f /root/.ssh/id_rsa -q -N ""
#sudo chmod 644 /home/vagrant/.ssh/id_rsa.pub
sudo chown vagrant:vagrant /root/.ssh/id_rsa.pub  
sshpass -p vagrant ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@osd1
sshpass -p vagrant ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@osd2
sshpass -p vagrant ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@osd3
sshpass -p vagrant ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@mon1
sshpass -p vagrant ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@mon2
sshpass -p vagrant ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@mon3
