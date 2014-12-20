class laptop {
  package { 'powertop': }
  package { 'smartmontools': }

  file { '/usr/bin/notify_low_battery':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/laptop/notify_low_battery'
  }

  file { '/usr/lib/systemd/system/notify_low_battery.timer':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/laptop/notify_low_battery.timer'
  }

  file { '/usr/lib/systemd/system/notify_low_battery.service':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/laptop/notify_low_battery.service'
  }

  service { 'notify_low_battery.timer':
    ensure  => running,
    enable  => true,
    require => [
      File['/usr/bin/notify_low_battery'],
      File['/usr/lib/systemd/system/notify_low_battery.timer'],
      File['/usr/lib/systemd/system/notify_low_battery.service']
    ]
  }
}
