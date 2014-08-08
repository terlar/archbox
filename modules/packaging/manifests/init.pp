class packaging {
  include aur

  package { 'abs': }
  aur::package { 'downgrader': }
}
