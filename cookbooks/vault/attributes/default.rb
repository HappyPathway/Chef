default[:vault][:version] = '0.10.4'
default[:vault][:install_type] = 'oss'
default[:vault][:enterprise][:download_url] = "https://s3-us-west-2.amazonaws.com/hc-enterprise-binaries/vault/ent/#{node[:vault][:version]}/vault-enterprise_#{node[:vault][:version]}%2Bent_linux_amd64.zip"
default[:vault][:oss][:download_url] = "https://releases.hashicorp.com/vault/#{node[:vault][:version]}/vault_#{node[:vault][:version]}_linux_amd64.zip"
