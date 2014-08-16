class networking::dns {
  package { 'dnsmasq': }

  service { 'systemd-resolved':
    ensure    => running,
    enable    => true
  }

  file { '/etc/resolv.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/networking/resolv.conf',
    require => Package['dnsmasq']
  }

  file { '/etc/dnsmasq.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/networking/dnsmasq.conf',
    require => Package['dnsmasq']
  }

  service { 'dnsmasq':
    ensure  => running,
    enable  => true,
    require   => [
      Service['systemd-resolved'],
      Package['dnsmasq'],
      File['/etc/resolv.conf'],
      File['/etc/dnsmasq.conf']
    ]
  }
}
