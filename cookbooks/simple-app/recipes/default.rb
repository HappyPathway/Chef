#
# Cookbook:: simple-app
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute 'apt-get update'
apt_package 'python-dev'
apt_package 'python-pip'
directory '/opt/app'
