Exec {
  logoutput => on_failure,
  path      => [
    '/bin',
    '/sbin',
    '/usr/bin',
    '/usr/sbin',
    '/usr/local/bin'
  ]
}

Package {
  ensure  => 'installed'
}

class core {
  include base
  include packaging
  include vcs
  include building
  include networking
  include console

  include users::root
  include users::terje
}

node default {
  include core
}

node falcon {
  include core
  class { 'fish':
    git     => true,
    plugins => true
  }

  include acpi
  include audio
  include bluetooth
  include idevice
  include printing
  include ssh::client

  include gui
  include gui::audio
  include gui::browser
  include gui::pdf
  class { 'vim':
    gui => true
  }

  include x11::joystick

  include development
  include mail
  include music
  include torrent

  include laptop::macbook

  include services::dropbox
  include services::elasticsearch
  include services::memcached
  include services::mongodb
  include services::mysql
  include services::nginx
  include services::prax
  include services::redis
  include services::varnish
}

node horse {
  include core
  class { 'fish':
    git     => true,
    plugins => true
  }

  include acpi
  class { 'audio':
    card => '1'
  }
  include bluetooth
  include idevice
  include printing
  include ssh::client

  include gui
  include gui::audio
  include gui::browser
  include gui::pdf
  class { 'vim':
    gui => true
  }

  include development
  include mail
  include music
  include torrent

  include laptop::macbook

  include services::dropbox
  include services::elasticsearch
  include services::memcached
  include services::mongodb
  include services::mysql
  include services::nginx
  include services::prax
  include services::redis
  include services::varnish
}
