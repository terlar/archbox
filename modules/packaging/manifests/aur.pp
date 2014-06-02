class packaging::aur {
  pacman::repository {'archlinuxfr':
    server   => 'http://repo.archlinux.fr/$arch',
    siglevel => 'Optional'
  }

  package { 'yaourt': }
}
