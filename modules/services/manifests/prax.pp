class services::prax {
  vcsrepo { '/opt/prax':
    ensure   => present,
    provider => 'git',
    source   => 'https://github.com/ysbaddaden/prax.git',
    revision => 'unstable'
  } ->
  file { '/usr/local/bin/praxd':
    ensure => present,
    source => '/opt/prax/install/initd',
    mode   => '0755'
  } ->
  exec { 'install prax nss':
    command => 'make install',
    cwd     => '/opt/prax/ext',
    creates => '/lib/libnss_prax.so.2'
  }

  # put prax to end of /etc/nsswitch.conf
}
