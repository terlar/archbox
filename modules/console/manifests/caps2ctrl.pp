class console::caps2ctrl {
  file { '/usr/share/keymaps':
    ensure => directory,
    owner  => 'root',
    group  => 'root'
  }

  file { '/usr/share/keymaps/us_caps2ctrl.map.gz':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/console/us_caps2ctrl.map.gz',
    require => File['/usr/share/keymaps']
  }

  file { '/etc/vconsole.conf':
    ensure  => present,
    content => 'KEYMAP=/usr/share/keymaps/us_caps2ctrl.map',
    owner   => 'root',
    group   => 'root',
    require => File['/usr/share/keymaps/us_caps2ctrl.map.gz']
  }
}
