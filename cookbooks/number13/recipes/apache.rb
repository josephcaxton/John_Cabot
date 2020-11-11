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
end




