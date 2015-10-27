class music {
  package {
    [
      'mpc',
      'ncmpcpp',
    ]:
  }

  package {
    [
      'mopidy',
      'mopidy-scrobbler',
      'mopidy-spotify',
      'mopidy-spotify-tunigo',
      'mopidy-soundcloud',
    ]: provider => 'aur',
  }

  service { 'mopidy':
    enable  => false,
    require => Package['mopidy'],
  }
}
