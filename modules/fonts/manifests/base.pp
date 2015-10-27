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
      'ttf-ms-win10',
    ]: provider => 'aur',
  }
  package { 'ttf-google-fonts':
    provider => 'aur',
    name     => 'ttf-google-fonts-git',
  }
}
