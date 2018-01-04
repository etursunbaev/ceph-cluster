nodes = [
  { :hostname => 'osd1', :ip => '192.168.1.51', :box => 'ubuntu-16.04', :ram => 4096, :osd => 'yes' },
  { :hostname => 'osd2', :ip => '192.168.1.52', :box => 'ubuntu-16.04', :ram => 4096, :osd => 'yes' },
  { :hostname => 'osd3', :ip => '192.168.1.53', :box => 'ubuntu-16.04', :ram => 4096, :osd => 'yes' },
  { :hostname => 'admin', :ip => '192.168.1.55', :box => 'ubuntu-16.04', :ram => 4096 }
]
 
Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = "bento/ubuntu-16.04"
      nodeconfig.vm.hostname = node[:hostname]
      nodeconfig.vm.network :private_network, ip: node[:ip], virtualbox__intnet: "NatNetwork"
      nodeconfig.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: 'wlp13s0'    

      nodeconfig.vm.provider :virtualbox do |vb|
          if node [:osd] == "yes"  
          vb.customize [ "createhd", "--filename", "disk_sdb-#{node[:hostname]}", "--size", "200000" ]
          vb.customize [ "storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disk_sdb-#{node[:hostname]}.vdi" ]          
          config.vm.provision "ansible", playbook: "ceph.yml"
          end  #  config.vm.provision "shell", path: "roo.sh"
          if node [:hostname] == "admin"
           config.vm.provision "ansible", playbook: "admin.yml"
          end             
      end
    end
  end
end