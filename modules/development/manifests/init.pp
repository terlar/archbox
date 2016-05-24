class development {
  include development::ruby
  include development::haskell
  include development::vagrant
  include development::docker

  package {
    [
      'pygmentize',
      'jq',
      'ctags',
    ]:
  }

  package {
    [
      'nodejs-jsonlint',
      'python-botocore',
    ]: provider => 'aur',
  }

  package { 'aws-cli':
    provider => 'aur',
    require  => Package['python-botocore'],
  }

  package { 'google-cloud-sdk':
    provider => 'aur'
  }

  package { 'mycli':
    provider => 'aur'
  }
}
