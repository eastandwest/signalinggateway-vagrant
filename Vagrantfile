# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y python-simplejson
  SHELL

  config.vm.provision "ansible" do |ansible|
    ansible.limit = 'janusservers'
    ansible.inventory_path = 'provisioning/hosts'
    ansible.playbook = 'provisioning/site.yml'
  end
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end
end
