#
# Author:: Seigo Uchida (<spesnova@gmail.com>)
# Cookbook Name:: my-hubot
# Attributes:: default
#
# Copyright (C) 2013 Seigo Uchida (<spesnova@gmail.com>)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# NOTE Use SSH clone URL for git ssh wrapper
default["hubot"]["repo"]            = "git@github.com:spesnova/my-hubot.git"
default["hubot"]["deploy_path"]     = "/opt/hubot"
default["hubot"]["user"]            = "hubot"
default["hubot"]["group"]           = "hubot"
default["hubot"]["name"]            = "hubot"
default["hubot"]["adapter"]         = "hipchat"

default["authorization"]["sudo"]["passwordless"] = true
default["authorization"]["sudo"]["sudoers_defaults"] = [
  "env_reset",
  "secure_path='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'"
]
