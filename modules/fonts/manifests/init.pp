class fonts {
  include fonts::base
  include fonts::extended
  include fonts::monospaced

  aur::package { 'font-manager': }
  package { 'freetype2': }
  package { 'fontconfig': }

  # infctl setstyle osx2
}
