class networking::dns {
  package { 'dnsmasq': }

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
    require => [
      Service['systemd-resolved'],
      Package['dnsmasq'],
      File['/etc/resolv.conf'],
      File['/etc/dnsmasq.conf']
    ]
  }
}
