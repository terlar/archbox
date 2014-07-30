class x11::mtrack {
  aur::package { 'xf86-input-mtrack-git': }

  file { '/etc/X11/xorg.conf.d/10-mtrack.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/x11/xorg.conf.d/10-mtrack.conf',
    require => Package['xorg-server']
 }
}
