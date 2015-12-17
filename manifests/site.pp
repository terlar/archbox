Exec {
  logoutput => on_failure,
  path      => [
    '/bin',
    '/sbin',
    '/usr/bin',
    '/usr/sbin',
    '/usr/local/bin',
  ]
}

Package {
  ensure  => 'installed',
}

class core {
  include base
  include packaging
  include vcs
  include building
  include networking
  include kmscon
  include console

  include users::root
  include users::terje
}

node default {
  include core
  class { 'fish':
    git     => false,
    plugins => false,
  }
}

node falcon {
  include core
  class { 'fish':
    git     => true,
    plugins => true,
  }
  class { 'vim':
    git => true,
    neo => true,
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

  include x11::joystick

  include development
  include mail
  include music
  include torrent

  include laptop::macbook

  include services::dropbox
  include services::nginx
  include services::prax
}

node horse {
  include core
  class { 'fish':
    git     => true,
    plugins => true,
  }
  class { 'vim':
    git => true,
    neo => true,
  }

  include acpi
  include audio
  class { 'bluetooth':
    ensure => running
  }
  include idevice
  include printing
  include ssh::client

  include gui
  include gui::audio
  include gui::browser
  include gui::pdf

  include development
  include mail
  include music
  include torrent

  include laptop::macbook

  include services::dropbox
  include services::nginx
  include services::prax
}
