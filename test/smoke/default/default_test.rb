# # encoding: utf-8

# Inspec test for recipe virtualbox::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('VirtualBox-5.2') do
  it { should be_installed }
end
