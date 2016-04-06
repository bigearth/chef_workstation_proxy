name             'chef_workstation_proxy'
maintainer       'Gabriel Cardona'
maintainer_email 'gabr13l@bigearth.io'
license          'GPL v2'
description      'To bring up and configure an Ubuntu instance for the Chef Workstation Proxy'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
supports         'ubuntu', '>= 14.04'
depends          "chef_client"
