#
# Author:: Seigo Uchida (<spesnova@gmail.com>)
# Cookbook Name:: spesnova-hubot
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

override["nodejs"]["install_method"] = "package"

default["hubot"]["version"]         = "2.4.6"
default["hubot"]["scripts_version"] = "2.4.1"
default["hubot"]["install_dir"]     = "/opt/hubot"
default["hubot"]["user"]            = "hubot"
default["hubot"]["group"]           = "hubot"
default["hubot"]["name"]            = "hubot"
default["hubot"]["auth_admin"]      = "spesnova"
default["hubot"]["adapter"]         = "kandan"
default["hubot"]["dependencies"]    = {
  "node-stringprep" => "0.1.5",
  "hubot-kandan"    => "git://github.com/narkisr/hubot-kandan.git"
}

# Config for kandan adapter
default["hubot"]["kandan_host"]     = "localhost"
default["hubot"]["kandan_port"]     = "80"
default["hubot"]["kandan_token"]    = "xxxxxxx"

default["hubot"]["config"]          = {
  "HUBOT_AUTH_ADMIN" => node["hubot"]["auth_admin"]
}

default["hubot"]["hubot_scripts"]   = %w{
  ackbar.coffee
  applause.coffee
  ascii.coffee
  b6n.coffee
  base64.coffee
  beerme.coffee
  botsnack.coffee
  cheer.coffee
  cowsay.coffee
  dnsimple.coffee
  gemwhois.coffee
  github-status.coffee
  good-night.coffee
  goooood.coffee
  horse.coffee
  haters.coffee
  kittens.coffee
  likeaboss.coffee
  look-of-disapproval.coffee
  nice.coffee
  pinkman.coffee
  polite.coffee
  quote.coffee
  rageface.coffee
  rimshot.coffee
  rubygems.coffee
  shipit.coffee
  shorten.coffee
  spin.coffee
  sudo.coffee
  sweetdude.coffee
  tweet.coffee
  walmart.coffee
  wat.coffee
  wunderground.coffee
  xkcd.coffee
  yoda-quotes.coffee
  yuno.coffee
}
