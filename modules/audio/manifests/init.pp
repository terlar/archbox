class audio($raop=false) {
  group { 'audio': ensure => present }

  if $raop == true {
    $package_name = 'pulseaudio-raop2'
    $package_provider = 'aur'
  } else {
    $package_name = 'pulseaudio'
    $package_provider = 'pacman'
  }

  package { 'pulseaudio':
    provider => $package_provider,
    name     => $package_name,
  }

  package { 'pulseaudio-alsa': }
  package { 'alsa-utils': }

  package { 'pulseaudio-dlna':
    provider => 'aur',
  }
}
