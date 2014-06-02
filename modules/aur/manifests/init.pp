class aur {
  file { '/tmp/aura.pkg.tar.xz':
    ensure => present,
    source => 'puppet:///modules/aur/aura.pkg.tar.xz'
  } ->
  package { 'aura-bin':
    ensure => present,
    source => '/tmp/aura.pkg.tar.xz'
  }
}
