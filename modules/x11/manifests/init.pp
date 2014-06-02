class x11 {
  include x11::launching
  include x11::locking
  include x11::notifying
  include x11::im

  package {
    [
      'xorg-server',
      'xorg-server-utils',
      'xdg-utils',
      'xsel',
      'xclip',
      'zenity'
    ]:
  }

  aur::package { 'xlogin-git': }

  file { '/etc/X11/xorg.conf.d/10-monitor.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/x11/xorg.conf.d/10-monitor.conf',
    require => Package['xorg-server']
  }
}
