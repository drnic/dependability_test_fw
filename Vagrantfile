# -*- mode: ruby -*-
# vi: set ft=ruby :

dhostname1 = "node1"
dhostname2 = "node2"

Vagrant.configure('2') do |config|

  config.vm.define :node1 do |n1_config|
    n1_config.vm.box = "precise64"
    n1_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    
    # Two Interfaces: one for host machine access, 
    # One for dedicated replication connection
    n1_config.vm.network :private_network, ip: '192.168.22.11'
    n1_config.vm.network :private_network, ip: '10.1.1.31'
    n1_config.vm.network "forwarded_port", guest: 80, host: 8080

    n1_config.vm.host_name = dhostname1

    n1_config.vm.provider :virtualbox do |v, override|
      v.customize ["modifyvm", :id, "--memory", 1024]
    end

    #n1_config.vm.synced_folder "share/", "/share"

    # persistent storage for DRBD

    n1_config.persistent_storage.location = "disks/sourcehdd.vdi"
    n1_config.persistent_storage.size = 5000

    n1_config.vm.provision :puppet do |n1_puppet|
      n1_puppet.working_directory = "/tmp"
      n1_puppet.module_path = "modules"
      n1_puppet.manifests_path = "manifests"
      n1_puppet.manifest_file = "site1.pp"
      n1_puppet.facter = { "fqdn" => dhostname1 }
    end
    n1_config.vm.provision :shell, :path => "script.sh"

  end

  config.vm.define :node2 do |n2_config|
    n2_config.vm.box = "precise64"
    n2_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    
    # Two Interfaces: one for host machine access, 
    # One for dedicated replication connection
    n2_config.vm.network :private_network, ip: "192.168.22.12"
    n2_config.vm.network :private_network, ip: "10.1.1.32"
    n2_config.vm.network "forwarded_port", guest: 80, host: 8088
    
    n2_config.vm.host_name = dhostname2

    n2_config.vm.provider :virtualbox do |v, override|
      v.customize ["modifyvm", :id, "--memory", 1024]
    end

    #n2_config.vm.synced_folder "share/", "/share"

    # persistent storage for DRBD
    n2_config.persistent_storage.location = "disks/sourcehdd2.vdi"
    n2_config.persistent_storage.size = 5000

    n2_config.vm.provision :puppet do |n2_puppet|
      n2_puppet.working_directory = "/tmp"
      n2_puppet.module_path = "modules"
      n2_puppet.manifests_path = "manifests"
      n2_puppet.manifest_file = "site2.pp"
      n2_puppet.facter = { "fqdn" => dhostname2 }
    end

    n2_config.vm.provision :shell, :path => "script.sh"
  end

end
