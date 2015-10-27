class packaging {
  package {
    [
      'abs',
      'pkgfile',
    ]:
  }

  package { 'downgrader':
    provider => 'aur',
  }
}
