#
# Cookbook:: virtualbox
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'virtualbox::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611')
      runner.converge(described_recipe)
    end

    it 'creates virtualbox repo with proper info ' do
      expect(chef_run).to create_yum_repository('virtualbox').with(baseurl: 'http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch')
      expect(chef_run).to create_yum_repository('virtualbox').with(enabled: true)
      expect(chef_run).to create_yum_repository('virtualbox').with(gpgcheck: true)
      expect(chef_run).to create_yum_repository('virtualbox').with(repo_gpgcheck: true)
      expect(chef_run).to create_yum_repository('virtualbox').with(gpgkey: 'https://www.virtualbox.org/download/oracle_vbox.asc')
    end

    it 'removes vitualbox package' do
      expect(chef_run).to remove_package('VirtualBox-5.1')
    end

    it 'installs vitualbox package' do
      expect(chef_run).to install_package('VirtualBox-5.2')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
