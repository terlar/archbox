# Add and configure the user terje
class users::terje inherits users {
  $username = 'terje'
  $home     = "/home/${username}"
  $code     = "${home}/Code"
  $dotfiles = "${code}/dotfiles"

  user { $username:
    ensure     => present,
    home       => $home,
    gid        => 'users',
    groups     => [
      'audio',
      'lpadmin',
      'users',
      'video',
      'wheel'
    ],
    managehome => true,
    shell      => '/usr/bin/fish',
    require    => [
      Group['users'],
      Package['fish']
    ]
  }

  file { $code:
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  file { "${home}/.ssh":
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  file { "${home}/.xmonad":
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  file { "${home}/.xmonad/lib":
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => File["${home}/.xmonad"]
  }

  vcsrepo { $dotfiles:
    ensure   => present,
    owner    => $username,
    group    => 'users',
    provider => 'git',
    source   => 'https://github.com/terlar/dotfiles.git',
    require  => [
      Package['fish'],
      File[$code],
      File["${home}/.ssh"],
      File["${home}/.xmonad/lib"]
    ]
  } ->
  exec { 'fish install.fish --overwrite-all':
    cwd         => $dotfiles,
    environment => "HOME=${home}",
    user        => $username
  }
}
