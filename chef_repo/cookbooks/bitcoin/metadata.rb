name             'bitcoin'
maintainer       'Gabriel Cardona'
maintainer_email 'gabr13l@bigearth.io'
license          'GPLv2'
description      'Installs/Configures the Bitcoin Core/XT/Classic'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "chef_client"

supports 'ubuntu'
