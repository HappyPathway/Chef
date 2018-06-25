#
# Cookbook:: vault-cluster
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'consul::default'
apt_update 'update' do
  action :update
end

pkgs = %w(curl unzip)
pkgs.each do |pkg|
  apt_package pkg
end

remote_file '/tmp/vault.zip' do
  source node[:vault][:download_url]
end

execute 'unzip /tmp/vault.zip' do
  cwd '/usr/local/bin'
end

tools = %w(vault)
tools.each do |tool|
  file "/usr/local/bin/#{tool}" do
    mode '0755'
    owner 'root'
  end
end

directories = ['/etc/vault.d']
directories.each do |dir|
  directory dir do
    owner 'root'
  end
end

cookbook_file '/etc/init/vault.conf' do
  source 'vault.conf'
end

cookbook_file '/etc/vault.d/vault-server.hcl' do
  source 'vault-server.hcl'
end
