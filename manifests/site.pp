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

Package { ensure => 'installed' }

class core {
  include base
  include packaging
  include networking

  include fish
  include vim
}

node default {
  include core

  include audio
  include printing
  include gui

  include xmonad

  include users::terje
}

class server {
}

class laptop {
  include networking::wifi

  include x11::intel
  include x11::mtrack
}

node 'falcon.farm' inherits default {
  include laptop
}

node 'horse.farm' inherits default {
  include laptop
}
