#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
dependencies = %w(libpcre3 libpcre3-dev zlib1g-dev nginx)
dependencies.each do |dep|
  apt_package dep
end

directory '/etc/nginx/conf.d/' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end




