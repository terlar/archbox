class fish {
  package { 'fish': }

  vcsrepo { '/opt/fry':
    ensure   => present,
    provider => 'git',
    source   => 'https://github.com/terlar/fry.git'
  } ->
  exec { 'install fry':
    command => 'make install',
    cwd     => '/opt/fry',
    creates => '/usr/local/share/fry'
  }

  vcsrepo { '/opt/fish-farm':
    ensure   => present,
    provider => 'git',
    source   => 'https://github.com/terlar/fish-farm.git'
  } ->
  exec { 'install fish-farm':
    command => 'make install',
    cwd     => '/opt/fish-farm',
    creates => '/usr/local/share/fish-farm'
  }

  vcsrepo { '/opt/fish-tank':
    ensure   => present,
    provider => 'git',
    source   => 'https://github.com/terlar/fish-tank.git'
  } ->
  exec { 'install fish-tank':
    command => 'make install',
    cwd     => '/opt/fish-tank',
    creates => '/usr/local/share/fish-tank'
  }
}
