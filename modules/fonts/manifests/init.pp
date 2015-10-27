class fonts {
  include fonts::base
  include fonts::extended

  package {
    [
      'fontconfig',
      'freetype2',
    ]:
  }

  package { 'font-manager':
    provider => 'aur',
  }
  package { 'fontmatrix':
    provider => 'aur',
    name     => 'fontmatrix-git',
  }
}
