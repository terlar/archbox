class fish::params {

  $package_ensure = 'present'
  $git            = false
  $plugins        = false

  case $::osfamily {
    'Archlinux': {
      $git_package_name = ['fish-shell-git']
      $package_name = ['fish']
    }
    'Linux': {
      case $::operatingsystem {
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
