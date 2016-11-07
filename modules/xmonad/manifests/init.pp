class xmonad {
  include x11

  package { 'xmonad': }
  package { 'xmonad-contrib':
    require => Package['ghc']
  }
}
