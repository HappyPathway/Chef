#
# Cookbook:: simple-app
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute "apt-get update"
apt_package "python-pip"
apt_package "supervisor"

directory "/opt/app"

cookbook_file "/etc/supervisor/conf.d/calculator.conf" do
    source "calculator.conf"
end

cookbook_file "/opt/app/calculator.py" do
    source "calculator.py"
end

cookbook_file "/tmp/requirements.txt" do
    source "requirements.txt"
end

execute "pip install -r /tmp/requirements.txt"
service "supervisor" do
    action :enable
end