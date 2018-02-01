#
# Cookbook:: virutalbox
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'virtualbox::default' do
  platforms = {
    'centos' => {
      'versions' => ['7.4.1708']
    }
  }


  platforms.keys.each do |platform|
    platforms[platform]['versions'].each do |version|
      context 'When all attributes are default, on an unspecified platform' do
        let(:chef_run) do
          # for a complete list of available platforms and versions see:
          # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
          runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
          runner.converge(described_recipe)
        end

        it 'executes a command' do
	  allow(File).to receive(:exist?).and_call_original
	  allow(File).to receive(:exist?).with("/etc/repos.d/virtualbox.repo").and_return(true)
	  expect(chef_run).to run_execute('/usr/bin/wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo')  
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
  end
end
