name             'hubot'
maintainer       'Seigo Uchida'
maintainer_email 'spesnova@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures spesnova-hubot'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.4'

depends "apt"
depends "build-essential"
depends "git"
depends "nodejs", ">= 1.3.0"
depends "sudo", ">= 1.7.2"

supports "ubuntu"
