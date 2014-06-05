class networking {
  include networking::dns

  file { '/etc/systemd/network':
    ensure => present,
    recurse => true,
    owner   => 'root',
    group   => 'root',
    source => 'puppet:///modules/networking/systemd'
  }

  service { 'systemd-networkd':
    ensure    => running,
    enable    => true,
    require   => File['/etc/systemd/network']
  }
}
