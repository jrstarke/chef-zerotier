name             'zerotier'
maintainer       'Jamie Starke'
maintainer_email 'github@jamiestarke.com'
license          'Apache 2.0'
description      'Installs/Configures zerotier'
version          '0.1.1'

%w{ ubuntu }.each do |os|
  supports os
end
