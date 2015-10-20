class fonts::base {
  package {
    [
      'ttf-dejavu',
      'ttf-liberation',
    ]:
  }

  aur::package {
    [
      'ttf-input',
      'ttf-google-fonts-git',
      'ttf-mac-fonts',
      'ttf-ms-win10',
    ]:
  }
}
