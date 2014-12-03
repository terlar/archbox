class printing {
  group { 'lpadmin': ensure => present }

  package { 'cups': }
  package { 'ghostscript': }
  aur::package { 'epson-inkjet-printer-escpr': }

  file { '/etc/cups/cups-files.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'lp',
    mode    => '0640',
    source  => 'puppet:///modules/printing/cups-files.conf',
    require => Package['cups']
  }

  service { 'cups-browsed':
    ensure  => running,
    enable  => true,
    require => [
      Package['cups'],
      File['/etc/cups/cups-files.conf']
    ]
  }

}
