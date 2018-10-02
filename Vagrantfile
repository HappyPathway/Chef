# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 2
    end
  
    config.vm.define "precise64" do |precise|
      precise.vm.box = "ubuntu/precise64"
      # precise.vm.synced_folder "./cache/precise", "/mnt/alpha/", owner:"root", :mount_options => ["dmode=700,fmode=600"]
      precise.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
    end
  
    config.vm.define "trusty64" do |trusty|
      trusty.vm.box = "ubuntu/trusty64"
      # trusty.vm.synced_folder "./cache/trusty", "/mnt/alpha/", owner:"root", :mount_options => ["dmode=700,fmode=600"]
      trusty.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
    end
  
    config.vm.define "xenial64" do |xenial|
      xenial.vm.box = "ubuntu/xenial64"
      # xenial.vm.synced_folder "./cache/xenial", "/mnt/alpha/", owner:"root", :mount_options => ["dmode=700,fmode=600"]
      xenial.vm.provision "shell", inline: "sudo apt-get install -y python python-dev"
      xenial.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
    end
  
    config.vm.synced_folder "#{ENV['HOME']}/.ssh/", "/root/.ssh/", owner:"root", :mount_options => ["dmode=700,fmode=600"]
    # config.vm.synced_folder "./schema/", "/tmp/db_schema/", owner:"root", :mount_options => ["dmode=700,fmode=600"]
    
    config.vm.provision "file", source: "/etc/hosts", destination: "/tmp/hosts"
    config.vm.provision "shell", inline: "sudo mv /tmp/hosts /etc/hosts"
    #config.vm.network "forwarded_port", guest: 9090, host: 9090
    #config.vm.network "forwarded_port", guest: 50001, host: 50001
    # config.vm.provision "shell", inline: "rm -rf /mnt/alpha/*"
    config.vm.provision "chef_client" do |chef|
        chef.encrypted_data_bag_secret_key_path = "#{ENV['HOME']}/.chef/encrypted_data_bag_secret"
        chef.chef_server_url = "https://api.chef.io/organizations/hashicorp"
        chef.validation_key_path = "#{ENV['CHEF_VALIDATION_KEY']}"
        chef.validation_client_name = "#{ENV['CHEF_VALIDATION_CLIENT_NAME']}"
        chef.add_role "#{ENV['CHEF_ROLE']}"
        chef.environment = "#{ENV['CHEF_ENV']}"
        chef.delete_node = true
        chef.delete_client = true
        chef.json = {
          :role => "#{ENV['CHEF_ROLE']}",
          :encrypted_data_bag_secret_path => "/tmp/vagrant-chef/encrypted_data_bag_secret_key"
        }
    end
  end