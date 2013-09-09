#
# Cookbook Name:: spesnova-hubot
# Recipe:: _kandan_adapter
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

node.override["hubot"]["kandan_host"]  = search(:node, "roles:kandan").first["ipaddress"]
node.override["hubot"]["kandan_token"] = data_bag_item("users", "hubot")["kandan_token"]

node.override["hubot"]["config"] = node.override["hubot"]["config"].merge({
  "HUBOT_KANDAN_HOST"  => node["hubot"]["kandan_host"],
  "HUBOT_KANDAN_PORT"  => node["hubot"]["kandan_port"],
  "HUBOT_KANDAN_TOKEN" => node["hubot"]["kandan_token"]
)}

