class networking::mdns {
  package {
    [
      'avahi',
      'nss-mdns'
    ]:
  }

  service { 'avahi-daemon':
    ensure    => running,
    enable    => true,
    require   => Package['avahi']
  }

  exec { 'nsswitch hosts add mdns_minimal':
    require   => Package['avahi'],
    command   => 'sed -i "s/^hosts:.*dns/& mdns_minimal/" /etc/nsswitch.conf',
    unless    => 'grep "^hosts:.*mdns.*" /etc/nsswitch.conf',
    logoutput => 'on_failure'
  }
}
