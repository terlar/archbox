class audio {
  group { 'audio': ensure => present }

  package { 'pulseaudio': }
  package { 'pulseaudio-alsa': }
  package { 'alsa-utils': }
}
