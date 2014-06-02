class printing {
  group { 'lpadmin': ensure => present }

  package { 'cups': }
  package { 'ghostscript': }
  aur::package { 'epson-inkjet-printer-escpr': }
}
