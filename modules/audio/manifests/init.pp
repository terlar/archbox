class audio($card=0) {
  group { 'audio': ensure => present }

  package { 'pulseaudio': }
  package { 'pulseaudio-alsa': }
  package { 'alsa-utils': }

  file { '/etc/modprobe.d/alsa-base.conf':
    ensure  => present,
    content => 'options snd-hda-intel power_save=1 model=mbp101'
  }

  exec { 'unmute_master':
    command => "amixer -c ${card} sset Master unmute",
    unless  => "amixer -c ${card} get Master | egrep 'Playback.*?\\[o' | egrep -o '\\[on\\]'",
    require => Package['alsa-utils']
  }
}
