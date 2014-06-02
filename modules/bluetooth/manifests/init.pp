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

  package { 'bluez': }
  package { 'bluez-utils': }

  service { 'bluetooth':
    ensure => $service_ensure,
    enable => $service_enabled
  }

  Package[bluez-utils] -> Package[bluez] -> Service[bluetooth]

  Package[bluez-utils] ~> Service[bluetooth]
  Package[bluez]       ~> Service[bluetooth]
}
