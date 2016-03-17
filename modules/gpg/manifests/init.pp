class gpg {
  package {
    [
      'gnupg',
      'pcsclite',
    ]:
  }

  package { 'parcimonie':
    provider => 'aur',
    name     => 'parcimonie-sh-git',
  }

  package { 'yubikey-neo-manager':
    provider => 'aur',
    name     => 'yubikey-neo-manager-git',
  }

  package { 'yubikey-personalization-gui':
    provider => 'aur',
    name     => 'yubikey-personalization-gui-git',
  }

  service { 'pcscd':
    enable  => true,
    require => Package['pcsclite']
  }
}
