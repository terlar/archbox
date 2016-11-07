class x11::utils {
  package {
    [
      'xorg-utils',
      'xorg-apps',
      'rofi',
    ]:
  }

  package { 'autopass':
      provider => 'aur',
      name     => 'autopass-git',
  }
}
