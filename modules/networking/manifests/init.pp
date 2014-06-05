class networking {
  file { '/etc/resolv.conf':
    ensure => link,
    owner  => 'root',
    group  => 'root',
    target => '/run/systemd/network/resolv.conf'
  }

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
    hasstatus => false,
    require   => [
      File['/etc/resolv.conf'],
      File['/etc/systemd/network']
    ]
  }
}
