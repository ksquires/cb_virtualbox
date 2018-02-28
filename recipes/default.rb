#
# Cookbook:: virtualbox
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

node.default['virtualbox']['version'] = '5.2'
include_recipe 'virtualbox-install::default'

package 'VirtualBox-5.2' do
  notifies :run, 'execute[kill vms]', :before
  action :upgrade
end

execute 'kill vms' do
  command 'vboxmanage list runningvms | sed -r \'s/.*\{(.*)\}/\1/\' | xargs -L1 -I {} VBoxManage controlvm {} savestate'
  action :nothing
end

execute 'vboxconfig' do
  command '/sbin/vboxconfig'
  user 'root'
  action :nothing
  subscribes :run, 'package[VirtualBox-5.2]', :immediately
end
