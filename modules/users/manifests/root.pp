# Add and configure the root user
class users::root inherits users {
  $username = 'root'
  $home     = "/${username}"

  user { $username:
    ensure     => present,
    home       => $home,
    gid        => 'root',
    groups     => ['root'],
    managehome => true,
    shell      => '/usr/bin/fish',
    require    => Package['fish']
  }
}
