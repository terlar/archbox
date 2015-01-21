class laptop::macbook inherits laptop {
  include networking::wifi

  include x11::intel
  include x11::mtrack

  aur::package { 'broadcom-wl-dkms': }

  aur::package { 'macfanctld-git': } ->
  service { 'macfanctld':
    ensure => running,
    enable => true
  }

  aur::package { 'kbdlight': }
}
