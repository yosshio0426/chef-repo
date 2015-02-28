#
# Cookbook Name:: japanese
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute 'Japanese Support' do
  user "root"
  command 'yum -y groupinstall "Japanese Support"'
  action :run
end

file "/etc/sysconfig/i18n" do
  owner 'root'
  group 'root'
  mode '0644'
  content <<-EOF
LANG="ja_JP.UTF-8"
SYSFONT="latarcyrheb-sun16"
  EOF
end

file "/etc/localtime" do
  owner 'root'
  group 'root'
  mode '0644'
  content IO.read( "/usr/share/zoneinfo/Japan" )
end

file "/etc/sysconfig/keyboard" do
  owner 'root'
  group 'root'
  mode '0644'
  content <<-EOF
KEYTABLE="jp106"
MODEL="jp106"
LAYOUT="jp"
KEYBOARDTYPE="pc"
  EOF
end
