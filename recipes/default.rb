#
# Cookbook Name:: spesnova-hubot
# Recipe:: default
#
# Copyright (C) 2013 Seigo Uchida
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

### OS packages required by assorted Hubot scripts ###
require_packages = Array.new

case node["platform_family"]
when "debian"
  require_packages = %w{ libexpat1 libexpat1-dev libicu-dev }
when "rhel"
  include_recipe "yum::epel"
  require_packages = %w{ libicu-devel libicu }
else
  Chef::Log.error "This recipe does not support this platform"
  return
end

require_packages.each do |pkg|
  package pkg do
    action :install
  end
end

# install hubot
include_recipe "hubot"

# TODO determine how to manage hubot script file
# TODO write some resource for hubot script file

# TODO LOG HANDLING
