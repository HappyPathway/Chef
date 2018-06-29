default[:consul][:install_type] = 'oss'
default[:consul][:version] = '1.2.0'
default[:consul][:enterprise][:download_url] = "https://s3.us-east-2.amazonaws.com/consul-dev-artifacts/consul-connect/#{node[:consul][:version]}/consul_#{node[:consul][:version]}_linux_amd64.zip"
default[:consul][:oss][:download_url] = "https://releases.hashicorp.com/consul/#{node[:consul][:version]}/consul_#{node[:consul][:version]}_linux_amd64.zip"
