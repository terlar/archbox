class base::filesystems {
  package {
    [
      'exfat-utils',
      'udisks2',
      'udiskie',
    ]:
  }

  service { 'udisks2':
    ensure  => running,
    enable  => true,
    require => Package['udisks2'],
  }
}
