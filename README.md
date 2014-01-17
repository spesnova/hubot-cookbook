## DESCRIPTION
This cookbook is designed to deploy the hubot instance with git. 

## REQUIREMENTS

### Chef

* 11

### Platform

* Ubuntu

Tested on:

* ubuntu-12.04

### Cookbook

* [apt](https://github.com/opscode-cookbooks/apt.git) (opscode)
* [build-essential](https://github.com/opscode-cookbooks/build-essential.git) (opscode)
* [git](https://github.com/opscode-cookbooks/git.git) (opscode)
* [nodejs](https://github.com/mdxp/nodejs-cookbook.git)
* [runit](https://github.com/hw-cookbooks/runit.git)

### Hubot Repository
See below link for preparing your hubot repository.

[Getting Started With Hubot](https://github.com/github/hubot/blob/master/docs/README.md)

## USAGE
Include the recipe on your node or role that fits how you wish to install and deploy Hubot on your system per the recipes section above. Modify the attributes as required in your role to change how various configuration is applied per the attributes section above. In general, override attributes in the role should be used when changing attributes.

## ATTRIBUTES

* `node["hubot"]["version"]` - The hubot version
* `node["hubot"]["deploy_path"]` - The path to deploy hubot.
* `node["hubot"]["user"]` - The user to install and run the hubot.
* `node["hubot"]["group"]` - The group to install and run the hubot.
* `node["hubot"]["name"]` - Alias name in chat for the hubot.
* `node["hubot"]["adapter"]` - The hubot adapter you use.
* `node["hubot"]["dependencies"]` - The dependency npm packages. Hash
* `node["hubot"]["config"]` - The config about the hubot. Hash

## RECIPES
### default

* Install dependent component (like git, node.js etc)
* Install Hubot Library
* Deploy Hubot with Git

## TESTING

```bash
$ script/bootstrap
$ kitchen test
```

## ROADMAP

* Include encrypted data bag in cookbook for test.
* Using data bag to manage hubot config to options.
 * Support config by node attributes.
* Using ssh wrapper in git resource to options.
* CI with wercker or travis.

## AUTHOR

Author:: Seigo Uchida (<spesnova@gmail.com>)

Copyright:: 2013-2014 Seigo Uchida (<spesnova@gmail.com>)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

```
http://www.apache.org/licenses/LICENSE-2.0
```

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
