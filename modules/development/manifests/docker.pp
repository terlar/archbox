class development::docker {
  package { 'docker': }

  group { 'docker': ensure => present }

  service { 'docker':
    ensure  => running,
    enable  => true,
    require => Package['docker']
  }
}
