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
      'antiword',
      'unrtf',
      'cdrkit',
      'cmatrix',
      'gnu-netcat',
      'httpie',
      'units',
      'youtube-dl',
      'bind-tools',
      'texlive-core',
      'the_silver_searcher',
      'moc',
    ]:
  }

  package {
    [
      'ngp',
      'mange',
      'ctodo',
      'jrnl',
      'httping',
    ]: provider => 'aur',
  }

  package { 'termit':
    provider => 'gem'
  }
}
