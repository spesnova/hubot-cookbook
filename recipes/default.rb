#
# Cookbook Name:: my-hubot
# Recipe:: default
#
# Copyright (C) 2013-2014 Seigo Uchida
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apt"
include_recipe "build-essential"

%w{ libexpat1 libexpat1-dev libicu-dev }.each do |p|
  package p
end

include_recipe "git"
include_recipe "runit"

#
# Install node.js
#
node.set["nodejs"]["install_method"] = "package"
include_recipe "nodejs"

#
# Install redis
#
package "redis-server"

#
# Create hubot user and group
#
user node["hubot"]["user"] do
  comment "Hubot"
  home "/home/hubot"
  supports :manage_home => true
end

group node["hubot"]["group"] do
  members [node["hubot"]["user"]]
end

sudo "hubot" do
  user "hubot"
  runas "root"
  nopasswd true
end

directory node["hubot"]["deploy_path"] do
  owner node["hubot"]["user"]
  group node["hubot"]["group"]
  recursive true
  mode  0755
end

#
# Create ssh wrapper
#
directory "/tmp/private_code/.ssh" do
  owner node["hubot"]["user"]
  recursive true
end

cookbook_file "/tmp/private_code/wrap-ssh4git.sh" do
  source "wrap-ssh4git.sh"
  owner node["hubot"]["user"]
  mode "0700"
end

file "/tmp/private_code/.ssh/deploy.id_rsa.pub" do
  owner node["hubot"]["user"]
  mode "0600"
  content Chef::EncryptedDataBagItem.load("deploy_keys", "my-hubot")["public_key"]
end

file "/tmp/private_code/.ssh/deploy.id_rsa" do
  owner node["hubot"]["user"]
  mode "0600"
  content Chef::EncryptedDataBagItem.load("deploy_keys", "my-hubot")["private_key"]
end

#
# Deploy my hubot
#
git node["hubot"]["deploy_path"] do
  repo node["hubot"]["repo"]
  user node["hubot"]["user"]
  group node["hubot"]["group"]
  revision "master"
  ssh_wrapper "/tmp/private_code/wrap-ssh4git.sh"
  action :sync
  notifies :run, "execute[npm install]", :immediately
end

execute "npm install" do
  cwd node["hubot"]["deploy_path"]
  user node["hubot"]["user"]
  group node["hubot"]["group"]
  environment(
    "USER" => node["hubot"]["user"],
    "HOME" => node["hubot"]["deploy_path"]
  )
  action :nothing
  notifies :restart, "service[hubot]", :delayed
end

#
# Start hubot instance
#
runit_service "hubot" do
  options node["hubot"].to_hash
  env Chef::EncryptedDataBagItem.load("users", "hubot")["hubot_config"]
end
