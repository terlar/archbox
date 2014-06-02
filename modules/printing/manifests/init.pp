class printing {
  group { 'lpadmin':
    ensure => present
  }

  package {
    [
      'cups',
      'ghostscript',
      'epson-inkjet-printer-escpr'
    ]:
  }
}
