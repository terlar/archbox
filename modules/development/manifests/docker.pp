class development::docker {
  package { 'docker': }

  group { 'docker': ensure => present }

  service { 'docker':
    ensure  => running,
    enable  => true,
    require => Package['docker']
  }

  file { '/etc/systemd/system/docker.service.d':
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/development/systemd/system/docker.service.d',
    recurse => true
  }
}
