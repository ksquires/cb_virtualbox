#
# Cookbook:: virtualbox
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

#include_recipe 'yum-virtualbox::default'
node.default['virtualbox']['version'] = '5.2'
include_recipe 'virtualbox-install::default'

package 'VirtualBox-5.2' do
  action :upgrade
end
