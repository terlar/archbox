class laptop {
  package { 'powertop': }
  package { 'smartmontools': }
  package { 'lm_sensors': }

  file { '/usr/bin/notify_low_battery':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/laptop/notify_low_battery'
  }

  file { '/etc/systemd/system/notify_low_battery.timer':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/laptop/notify_low_battery.timer'
  }

  file { '/etc/systemd/system/notify_low_battery.service':
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
      File['/etc/systemd/system/notify_low_battery.timer'],
      File['/etc/systemd/system/notify_low_battery.service']
    ]
  }

  file { '/etc/systemd/system/powertop.service':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/laptop/powertop.service'
  }

  service { 'powertop':
    ensure  => running,
    enable  => true,
    require => [
      Package['powertop'],
      File['/etc/systemd/system/powertop.service']
    ]
  }
}
