class kmscon {
  package { 'kmscon': }

  file { '/etc/kmscon':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root'
  }

  file { '/etc/kmscon/kmscon.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/kmscon/kmscon.conf',
    require => File['/etc/kmscon']
  }

  file { '/usr/lib/systemd/system/autovt@.service':
    ensure  => 'link',
    target  => '/usr/lib/systemd/system/kmsconvt@.service',
    require => Package['kmscon']
  }
}
