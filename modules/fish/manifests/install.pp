class fish::install inherits fish {

  if $git {
    package { 'fish':
      ensure => $package_ensure,
      name   => $git_package_name
    }
  } else {
    package { 'fish':
      ensure => $package_ensure,
      name   => $package_name
    }
  }

}
