#
# Cookbook:: number13
# Recipe:: apache
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute 'apt-get-update' do
    command 'apt-get update'
    action :run
end
package 'apache2' do
    action :install
end
apt_package "vim" do
    action :install
   end

template '/var/www/html/index.html' do
    source 'index.html.erb'
    owner 'www-data'
    group 'www-data'
    mode '0644'
    action :create
    variables({
        :platform => node['platform'],
        :version => node['platform_version'],
        :ip => node['ipaddress']
    })
end

directory '/var/www/html/images' do
    owner 'www-data'
    group 'www-data'
    mode '0755'
    recursive true
    action :create
end
remote_file '/var/www/html/images/rick.gif' do
    source 'https://media.giphy.com/media/8h1Zhv62CVXEc/giphy.gif'
    owner 'www-data'
    group 'www-data'
    mode '0644'
    action :create
end







