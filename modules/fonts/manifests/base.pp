class fonts::base {
  package {
    [
      'ttf-dejavu',
      'ttf-liberation',
      'ttf-droid',
      'ttf-ubuntu-font-family',
    ]:
  }

  aur::package {
    [
      'ttf-opensans',
      'ttf-mac-fonts',
      'ttf-vista-fonts',
      'ttf-roboto'
    ]:
  }
}
