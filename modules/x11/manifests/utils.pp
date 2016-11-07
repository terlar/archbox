class x11::utils {
  package {
    [
      'xorg-utils',
      'xorg-apps',
    ]:
  }

  package { 'rofi':
      provider => 'aur',
      name     => 'rofi-git',
  }

  package { 'rofi-surfraw':
      provider => 'aur',
      name     => 'rofi-surfraw-git',
  }

  package { 'autopass':
      provider => 'aur',
      name     => 'autopass-git',
  }
}
