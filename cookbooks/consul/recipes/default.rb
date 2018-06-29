#
# Cookbook:: consul
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

apt_update 'update' do
  action :update
end

pkgs = %w(curl unzip)
pkgs.each do |pkg|
  apt_package pkg
end

install_type = node[:consul][:install_type]
remote_file '/tmp/consul.zip' do
  source node[:consul][install_type][:download_url]
end

execute 'unzip /tmp/consul.zip' do
  cwd '/usr/local/bin'
end

directory '/etc/consul.d'

tools = ['consul']
tools.each do |tool|
  file "/usr/local/bin/#{tool}" do
    mode '0755'
    owner 'root'
  end
end

template '/etc/init/consul.conf' do
  source 'consul.conf.erb'
end

directories = ['/etc/consul.d/', '/opt/consul/data']
directories.each do |dir|
  directory dir do
    owner 'root'
    recursive true
  end
end

cookbook_file '/etc/consul.d/consul-default.json' do
  source 'consul-default.json'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/etc/consul.d/consul-connect.json' do
  source 'consul-connect.json'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
