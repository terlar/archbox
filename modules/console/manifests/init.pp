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
    ]:
  }

  aur::package { 'silver-searcher-git': }
  aur::package { 'ngp': }
  aur::package { 'mange': }
  aur::package { 'ctodo': }
  aur::package { 'jrnl': }
  aur::package { 'httping': }

  package { 'termit':
    provider => 'gem'
  }
}
