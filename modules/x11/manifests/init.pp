class x11 {
  include x11::launching
  include x11::locking
  include x11::notifying
  include x11::im

  package {
    [
      'xorg-server',
      'xorg-server-utils',
      'lightdm',
      'lightdm-gtk-greeter',
      'polkit-gnome',
      'xdg-utils',
      'xsel',
      'xclip',
      'zenity',
      'xcompmgr',
      'gksu',
    ]:
  }

  package {
    [
      'xcape',
      'redshift-minimal',
    ]: provider => 'aur',
  }

  package { 'autorandr':
    provider => 'aur',
    name     => 'autorandr-git',
  }

  file { '/etc/X11/xorg.conf.d/10-monitor.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/x11/xorg.conf.d/10-monitor.conf',
    require => Package['xorg-server'],
  }

  file { '/etc/X11/xorg.conf.d/90-custom-kbd.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/x11/xorg.conf.d/90-custom-kbd.conf',
    require => Package['xorg-server'],
  }

  file { '/etc/lightdm/lightdm-gtk-greeter.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/x11/lightdm/lightdm-gtk-greeter.conf',
    require => Package['lightdm'],
  }

  service { 'lightdm':
    enable  => true,
    require => Package['lightdm'],
  }

  service { 'getty@tty1':
    enable => false,
  }
}
