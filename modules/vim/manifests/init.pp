class vim($neo=false, $git=false) {
  if $neo == true {
    if $git == true {
      $package_name = 'neovim-git'
      $package_provider = 'aur'
    } else {
      $package_name = 'neovim'
      $package_provider = 'pacman'
    }
  } else {
    $package_name = 'vim'
    $package_provider = 'pacman'
  }

  package { 'vim':
    provider => $package_provider,
    name     => $package_name,
  }

  if $neo == true {
    package { 'python-neovim': }
  }

  package { 'vim-spell-sv': }
}
