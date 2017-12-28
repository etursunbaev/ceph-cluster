
nodes = [
  { :hostname => 'mon1', :ip => '192.168.1.41', :box => 'ubuntu-16.04' },
  { :hostname => 'mon2', :ip => '192.168.1.42', :box => 'ubuntu-16.04' },
  { :hostname => 'mon3', :ip => '192.168.1.43', :box => 'ubuntu-16.04' },
  { :hostname => 'osd1', :ip => '192.168.1.51', :box => 'ubuntu-16.04', :ram => 2048, :osd => 'yes' },
  { :hostname => 'osd2', :ip => '192.168.1.52', :box => 'ubuntu-16.04', :ram => 2048, :osd => 'yes' },
  { :hostname => 'osd3', :ip => '192.168.1.53', :box => 'ubuntu-16.04', :ram => 2048, :osd => 'yes' },
  { :hostname => 'control', :ip => '192.168.1.40', :box => 'ubuntu-16.04', :control => 'yes'}
]
 
Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = "bento/ubuntu-16.04"
      nodeconfig.vm.hostname = node[:hostname]
      nodeconfig.vm.network :private_network, ip: node[:ip]
       nodeconfig.vm.network "public_network", 
        use_dhcp_assigned_default_route: true, bridge: 'wlp13s0'    

      memory = node[:ram] ? node[:ram] : 1024;
      nodeconfig.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id, "--memory", memory.to_s,
        ]
        if node[:osd] == "yes"
          vb.customize [ "createhd", "--filename", "disk_sdb-#{node[:hostname]}", "--size", "50000" ]
          vb.customize [ "storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disk_sdb-#{node[:hostname]}.vdi" ]
          vb.customize [ "createhd", "--filename", "disk_sdg-#{node[:hostname]}", "--size", "50000" ]
          vb.customize [ "storageattach", :id, "--storagectl", "SATA Controller", "--port", 2, "--device", 0, "--type", "hdd", "--medium", "disk_sdg-#{node[:hostname]}.vdi" ]
          vb.customize [ "createhd", "--filename", "disk_sdd-#{node[:hostname]}", "--size", "50000" ]
          vb.customize [ "storageattach", :id, "--storagectl", "SATA Controller", "--port", 3, "--device", 0, "--type", "hdd", "--medium", "disk_sdd-#{node[:hostname]}.vdi" ]
        end
        config.vm.provision "ansible", playbook: "install-packages.yml"
        config.ssh.username = "root"
        config.ssh.password = "vagrant"
        config.ssh.insert_key = 'true'
        end
      end
    end
    #config.hostmanager.enabled = true
    #config.hostmanager.manage_guest = true
    end
end