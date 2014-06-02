# Setup sudo with wheel group in sudoers
class base::sudo {
  package { 'sudo': }

  group { 'wheel':
    ensure => present
  }

  file { '/etc/sudoers.d/allow-wheel':
    ensure  => present,
    content => '%wheel ALL=(ALL) ALL',
    mode    => '0440',
    require => Package['sudo']
  }
}
