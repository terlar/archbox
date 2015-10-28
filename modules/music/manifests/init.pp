class music {
  package {
    [
      'mopidy',
      'ncmpcpp',
      'mpc',
    ]:
  }

  package {
    [
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
