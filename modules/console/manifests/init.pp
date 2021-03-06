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
      'most',
      'pdfgrep',
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
      'ripgrep',
      'pssh',
    ]:
  }

  package {
    [
      'ngp',
      'mange',
      'ctodo',
      'jrnl',
      'httping',
      'playerctl',
      'dasht',
      'http-prompt',
    ]: provider => 'aur',
  }

  package { 'termit':
    provider => 'gem'
  }
}
