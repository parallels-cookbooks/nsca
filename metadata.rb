name             'nsca'
maintainer       'Andrei Skopenko'
maintainer_email 'andrey@scopenco.net'
license          'Apache 2.0'
description      'Installs/Configures NSCA daemon/client'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'amazon'
supports 'redhat'
supports 'centos'
supports 'scientific'
supports 'fedora'
supports 'debian'
supports 'ubuntu'

depends 'yum-epel'

recipe 'nsca::default', 'Install and configure NSCA daemon and client'
recipe 'nsca::server', 'Install and configure NSCA daemon'
recipe 'nsca::client', 'Install and configure NSCA client'
