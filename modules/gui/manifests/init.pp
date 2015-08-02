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
      'scrot',
      'baobab',
      'goldendict',
    ]:
  }
}
