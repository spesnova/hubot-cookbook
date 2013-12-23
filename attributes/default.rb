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

default["hubot"]["version"]         = "2.6.3"
default["hubot"]["scripts_version"] = "2.5.4"
default["hubot"]["install_dir"]     = "/opt/hubot"
default["hubot"]["user"]            = "hubot"
default["hubot"]["group"]           = "hubot"
default["hubot"]["name"]            = "hubot"
default["hubot"]["adapter"]         = nil
default["hubot"]["dependencies"]    = {}
default["hubot"]["config"]          = {}
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
