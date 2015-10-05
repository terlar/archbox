class fonts {
  include fonts::base
  include fonts::extended

  aur::package {
    [
      'font-manager',
      'fontmatrix-git',
    ]:
  }
  package { 'freetype2': }
  package { 'fontconfig': }
}
