#
# Cookbook:: virtualbox
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

yum_repository 'virtualbox' do
  baseurl 'http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch'
  enabled true
  gpgcheck true
  repo_gpgcheck true
  gpgkey 'https://www.virtualbox.org/download/oracle_vbox.asc'
  action :create
  description 'VirtualBox'
end

package 'VirtualBox-5.1' do
  action :remove
end

package 'VirtualBox-5.2' do
  action :install
end
