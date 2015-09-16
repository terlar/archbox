# Add and configure the user terje
class users::terje inherits users {
  $username  = 'terje'
  $home      = "/home/${username}"

  $code      = "${home}/code"
  $dotfiles  = "${code}/terlar/dotfiles"

  $downloads = "${home}/downloads"
  $mail      = "${home}/mail"
  $music     = "${home}/music"
  $pictures  = "${home}/pictures"
  $videos    = "${home}/videos"
  $dropbox   = "${home}/Dropbox"

  user { $username:
    ensure     => present,
    home       => $home,
    gid        => 'users',
    groups     => [
      'audio',
      'docker',
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
  file { "${home}/books":
    ensure  => link,
    target  => "${dropbox}/books",
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  file { "${home}/documents":
    ensure  => link,
    target  => "${dropbox}/documents",
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  file { "${home}/learning":
    ensure  => link,
    target  => "${dropbox}/learning",
    owner   => $username,
    group   => 'users',
    require => User[$username]
  }

  file { "${home}/notes":
    ensure  => link,
    target  => "${dropbox}/notes",
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
