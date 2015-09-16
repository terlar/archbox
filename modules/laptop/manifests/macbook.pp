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

  file { '/etc/systemd/logind.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/laptop/suspend-fix/logind.conf'
  }

  file { '/etc/sysctl.d/90-disable-swapiness.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/laptop/suspend-fix/90-disable-swapiness.conf'
  }

  file { '/etc/udev/rules.d/90-xhc_sleep.rules':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/laptop/suspend-fix/90-xhc_sleep.rules'
  }
}
