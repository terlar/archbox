class fonts::base {
  package {
    [
      'ttf-dejavu',
      'ttf-liberation',
    ]:
  }

  package {
    [
      'ttf-input',
      'ttf-mac-fonts',
    ]: provider => 'aur',
  }
  package { 'ttf-google-fonts':
    provider => 'aur',
    name     => 'ttf-google-fonts-git',
  }
}
