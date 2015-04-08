class development {
  include development::ruby
  include development::haskell
  include development::vagrant
  include development::docker

  package { 'pygmentize': }
  package { 'ctags': }

  aur::package { 'jq': }
  aur::package { 'nodejs-jsonlint': }
  aur::package { 'aws-cli': }
}
