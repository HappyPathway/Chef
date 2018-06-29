default[:nomad][:version] = '0.8.4'
default[:nomad][:install_type] = 'oss'
default[:nomad][:oss][:download_url] = "https://releases.hashicorp.com/nomad/#{node[:nomad][:version]}/nomad_#{node[:nomad][:version]}_linux_amd64.zip"
