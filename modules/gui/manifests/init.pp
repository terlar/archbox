class gui {
  group { 'video': ensure => present }

  include xmonad
  include gtk
  include fonts

  package {
    [
      'termite',
      'arandr',
      'gcolor2',
      'feh',
      'sxiv',
      'gpicview',
      'scrot',
      'baobab',
      'goldendict',
      'gifsicle',
    ]:
  }

  file { '/usr/share/pixmaps/wallpaper.png':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/gui/pixmaps/wallpaper.png',
  }
}
