#!/bin/bash
ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""
sudo chmod 644 /home/vagrant/.ssh/id_rsa.pub
sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa.pub  
echo "DONE"
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@osd1
echo "DONE osd1"
sudo sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@osd2
echo "DONE osd2"
sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@mon
echo "DONE mon"