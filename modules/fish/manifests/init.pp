class fish(
  $package_ensure   = $fish::params::package_ensure,
  $package_name     = $fish::params::package_name,
  $git_package_name = $fish::params::git_package_name,
  $git              = $fish::params::git,
  $plugins          = $fish::params::plugins
) inherits fish::params {

  validate_string($package_ensure)
  validate_array($package_name)
  validate_array($git_package_name)
  validate_bool($git)
  validate_bool($plugins)

  anchor { 'fish::begin': } ->
  class { '::fish::install': } ->
  class { '::fish::plugins': } ~>
  anchor { 'fish::end': }

}
