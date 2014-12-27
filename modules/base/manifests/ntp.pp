class base::ntp {
  package { 'ntp': }

  service { 'ntpd':
    ensure  => running,
    enable  => true,
    require => Package['ntp']
  }
}
