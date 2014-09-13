class music {
  package {
    [
      'mpc',
      'ncmpcpp'
    ]:
  }
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
