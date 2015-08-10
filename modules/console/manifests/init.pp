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
    ]:
  }

  aur::package { 'ngp': }
  aur::package { 'mange': }
  aur::package { 'ctodo': }
  aur::package { 'jrnl': }
  aur::package { 'httping': }

  package { 'termit':
    provider => 'gem'
  }
}
