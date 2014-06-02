# Add and configure the user terje
class users::terje inherits users {
  include vim
  include mutt
  include fonts::source_code_pro

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

  #repository { $dotfiles:
  #source  => 'terlar/dotfiles',
  #require => File[$code]
  #}
}
