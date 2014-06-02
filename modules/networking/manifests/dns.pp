class networking::dns {
  package { 'avahi': }
  package { 'nss-mdns': }
  package { 'dnsmasq': }
}
