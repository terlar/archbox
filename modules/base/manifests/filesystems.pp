class base::filesystems {
  package {
    [
      'exfat-utils',
      'udisks2',
      'udiskie',
    ]:
  }

  package { 'tmsu':
    provider => 'aur',
    name     => 'tmsu',
  }

  service { 'udisks2':
    ensure  => running,
    enable  => true,
    require => Package['udisks2'],
  }
}
