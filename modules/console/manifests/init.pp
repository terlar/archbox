class console {
  include console::caps2ctrl
  include console::monitoring
  include console::screen
  include console::passwords
  include console::spelling
  include console::ftp
  include console::irc

  package {
    [
      'reptyr',
      'ranger',
      'vimpager',
      'unrtf',
      'cdrkit',
      'cmatrix',
    ]:
  }

  aur::package { 'silver-searcher-git': }
  aur::package { 'ctodo': }

  package { 'termit':
    provider => 'gem'
  }
}
