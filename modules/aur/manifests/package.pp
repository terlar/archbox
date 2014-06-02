define aur::package($ensure=present) {
  case $ensure {
    'present': {
      exec { "aur::install::${name}":
        require   => Package['aura-bin'],
        command   => "sudo aura -A --noconfirm ${name}",
        unless    => "aura -Qk ${name}",
        logoutput => 'on_failure'
      }
    }
    'absent': {
      exec { "aur::remove::${name}":
        require   => Package['aura-bin'],
        command   => "sudo aura -Rs ${name}",
        onlyif    => "aura -Qi ${name}",
        logoutput => 'on_failure',
      }
    }
    default: {
      fail("Aur::Package[${name}] ensure parameter must be either 'present' or 'absent'")
    }
  }
}
