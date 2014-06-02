class networking {
  package {
    [
      'openssh',
      'sshfs',
      'mosh',
      'monkeysphere',
      'envoy-git'
    ]:
  }

  file { '/etc/resolv.conf':
    ensure => link,
    owner  => 'root',
    group  => 'root',
    target => '/run/systemd/network/resolv.conf'
  }

  file { '/etc/systemd/network/20-dhcp.network':
    ensure => present,
    source => 'puppet:///modules/networking/dhcp.network'
  }

  service { 'systemd-networkd':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    require   => [
      File['/etc/resolv.conf'],
      File['/etc/systemd/network/20-dhcp.network']
    ]
  }
}
