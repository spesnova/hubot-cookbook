#
# Cookbook Name:: spesnova-hubot
# Recipe:: _hipchat_adapter
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

#
# hubot config
#
hubot_config = Chef::EncryptedDataBagItem.load("users", "hubot")["hubot_config"]
p Chef::EncryptedDataBagItem.load("users", "hubot")
p Chef::Config[:encrypted_data_bag_secret]
p hubot_config

node.override["hubot"]["config"].merge!({
  "HUBOT_HIPCHAT_TOKEN"    => hubot_config["hubot_hipchat_token"],
  "HUBOT_HIPCHAT_JID"      => hubot_config["hubot_hipchat_jid"],
  "HUBOT_HIPCHAT_PASSWORD" => hubot_config["hubot_hipchat_password"],
  "HUBOT_HIPCHAT_ROOMS"    => hubot_config["hubot_hipchat_rooms"]
})

#
# hubot dependencies
#
node.override["hubot"]["dependencies"].merge!({
  "hubot-hipchat" => "2.6.4"
})
