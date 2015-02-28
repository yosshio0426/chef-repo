#
# Cookbook Name:: desktop
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute 'X Window System' do
  user "root"
  command 'yum -y groupinstall "X Window System"'
  action :run
end

execute 'Desktop' do
  user "root"
  command 'yum -y groupinstall Desktop'
  action :run
end

file "/etc/inittab" do
  owner 'root'
  group 'root'
  mode '0644'
  content <<-EOF
id:5:initdefault:
  EOF
end
