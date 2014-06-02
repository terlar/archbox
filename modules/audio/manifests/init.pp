class audio {
  group { 'audio':
    ensure => present
  }

  package {
    [
      'pulseaudio',
      'pulseaudio-alsa',
      'alsa-utils'
    ]:
  }
}
