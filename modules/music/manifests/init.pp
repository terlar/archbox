class music {
  package { 'ncmpcpp': }
  aur::package {
    [
      'mopidy',
      'mopidy-scrobbler',
      'mopidy-spotify',
      'mopidy-soundcloud'
    ]:
  }
}
