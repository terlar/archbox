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
      'aws-cli',
    ]: provider => 'aur',
  }
}
