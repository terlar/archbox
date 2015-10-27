class x11::mtrack {
  package { 'xf86-input-mtrack':
    provider => 'aur',
    name     => 'xf86-input-mtrack-git',
  }

  file { '/etc/X11/xorg.conf.d/10-mtrack.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/x11/xorg.conf.d/10-mtrack.conf',
    require => [Package['xorg-server'], Package['xf86-input-mtrack']],
 }
}
