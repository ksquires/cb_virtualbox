describe yum.repo('virtualbox') do
  it { should exist }
  it { should be_enabled }
end
describe file('/etc/yum.repos.d/virtualbox.repo') do
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe package('VirtualBox-5.1') do
  it { should be_removed}
end

describe package('VirtualBox-5.2') do
  it { should be_installed }
end
