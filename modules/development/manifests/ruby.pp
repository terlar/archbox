class development::ruby {
  package { 'ruby': }

  package { 'ruby-install':
    provider => 'aur',
    name     => 'ruby-install-git',
  }
}
