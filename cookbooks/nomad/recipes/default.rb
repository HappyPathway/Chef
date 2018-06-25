#
# Cookbook:: nomad
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'vault-cluster::default'

remote_file '/tmp/nomad.zip' do
  source node[:nomad][:download_url]
end

execute 'unzip /tmp/nomad.zip' do
  cwd '/usr/local/bin'
end

directory '/etc/nomad.d'

cookbook_file '/etc/init/nomad.conf' do
  source 'nomad.conf'
end
