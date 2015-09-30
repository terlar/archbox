class fonts {
  include fonts::base
  include fonts::extended

  aur::package { 'font-manager': }
  package { 'freetype2': }
  package { 'fontconfig': }
}
