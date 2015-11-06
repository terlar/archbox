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
      'spotify',
      'mopidy-scrobbler',
      'mopidy-spotify',
      'mopidy-spotify-tunigo',
      'mopidy-soundcloud',
    ]: provider => 'aur',
  }
}
