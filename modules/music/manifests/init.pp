class music {
  package { 'ncmpcpp': }
  aur::package {
    [
      'mopidy',
      'mopidy-scrobbler',
      'mopidy-spotify',
      'mopidy-soundcloud'
    ]:
  } ->
  service { 'mopidy':
    ensure  => stopped,
    enable  => false
  }
}
