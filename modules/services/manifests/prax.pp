class services::prax {
  vcsrepo { '/opt/prax':
    ensure   => present,
    provider => 'git',
    source   => 'https://github.com/ysbaddaden/prax.git',
    revision => 'master'
  }
}
