class bluetooth($ensure=stopped) {
  if !($ensure in [ 'running', 'stopped' ]) {
    fail('bluetooth ensure parameter must be running or stopped')
  }

  if $ensure == 'running' {
    $service_ensure = running
    $service_enabled = true
  } else {
    $service_ensure = stopped
    $service_enabled = false
  }

  package {
    [
      'bluez',
      'bluez-utils',
    ]:
  }

  package { 'blueproximity':
    provider => 'aur',
  }

  service { 'bluetooth':
    ensure => $service_ensure,
    enable => $service_enabled
  }

  Package[bluez-utils] -> Package[bluez] -> Service[bluetooth]

  Package[bluez-utils] ~> Service[bluetooth]
  Package[bluez]       ~> Service[bluetooth]

  file { '/etc/udev/rules.d/10-bluetooth.rules':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/bluetooth/udev/10-bluetooth.rules'
  }

  file { '/etc/systemd/system/bluetooth-auto-power@.service':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/bluetooth/systemd/system/bluetooth-auto-power@.service'
  }

  service { 'bluetooth-auto-power@0':
    ensure  => running,
    enable  => true,
    require => [
      File['/etc/systemd/system/bluetooth-auto-power@.service'],
    ]
  }
}
