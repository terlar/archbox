class gui {
  group { 'video':
    ensure => present
  }

  include x11
}
