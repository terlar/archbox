class gpg {
  package { 'gnupg': }

  package { 'yubikey-neo-manager':
    provider => 'aur',
    name     => 'yubikey-neo-manager-git',
  }

  package { 'yubikey-personalization-gui':
    provider => 'aur',
    name     => 'yubikey-personalization-gui-git',
  }
}
