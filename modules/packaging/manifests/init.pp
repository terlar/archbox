class packaging {
  include aur

  package {
    [
      'abs',
      'pkgfile'
    ]:
  }
  aur::package { 'downgrader': }
}
