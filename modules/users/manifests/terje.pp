# Add and configure the user terje
class users::terje inherits users {
  $username  = 'terje'
  $home      = "/home/${username}"

  $code      = "${home}/Code"
  $dotfiles  = "${code}/dotfiles"

  $downloads = "${home}/Downloads"
  $mail      = "${home}/Mail"
  $music     = "${home}/Music"
  $pictures  = "${home}/Pictures"
  $videos    = "${home}/Videos"
  $dropbox   = "${home}/Dropbox"

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

  # Code directory
  file { $code:
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  # Downloads directory
  file { $downloads:
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  # Mail directories
  file { $mail:
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  file { "${mail}/personal":
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => File[$mail]
  }

  file { "${mail}/work":
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => File[$mail]
  }

  # Music directory
  file { $music:
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  # Pictures directory
  file { $pictures:
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  # Videos directory
  file { $videos:
    ensure  => directory,
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  # Dropbox directories
  file { "${home}/Books":
    ensure  => link,
    target  => "${dropbox}/Books",
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  file { "${home}/Documents":
    ensure  => link,
    target  => "${dropbox}/Documents",
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  file { "${home}/Learning":
    ensure  => link,
    target  => "${dropbox}/Learning",
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  file { "${home}/Notes":
    ensure  => link,
    target  => "${dropbox}/Notes",
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  # Dotfile directories
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
