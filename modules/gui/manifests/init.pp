class gui {
  group { 'video': ensure => present }

  include xmonad
  include gtk
  include fonts

  package {
    [
      'arandr',
      'gcolor2',
      'feh',
      'scrot',
      'baobab'
    ]:
  }

  aur::package { 'termite-git': }
}
