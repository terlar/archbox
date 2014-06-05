class vim($gui=false) {
  if $gui == true {
    $package_name = 'gvim'
  } else {
    $package_name = 'vim'
  }

  package { 'vim':
    name => $package_name
  }
  package { 'vim-spell-sv': }
}
