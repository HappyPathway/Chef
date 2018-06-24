#
# Cookbook:: vault-cluster
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


apt_update "update" do
    action :update 
end

pkgs = ["curl", "unzip"]
pkgs.each do |pkg|
    apt_package pkg
end

remote_file "/tmp/vault.zip" do
    source node[:vault][:download_url]
end

remote_file "/tmp/consul.zip" do
    source node[:consul][:download_url]
end

execute "unzip /tmp/vault.zip" do
    cwd "/usr/local/bin"
end

execute "unzip /tmp/consul.zip" do
    cwd "/usr/local/bin"
end

directory "/etc/consul.d" 

tools = ["vault", "consul"]
tools.each do |tool|
    file "/usr/local/bin/#{tool}" do
        mode "0755"
        owner "root"
    end
end

template "/etc/init/consul.conf" do
    source "consul.conf.erb"
end

directories = ["/etc/consul.d/", "/etc/vault.d"]
directories.each do |dir|
    directory dir do
        owner "root"
    end
end