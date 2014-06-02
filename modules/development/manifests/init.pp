class development {
  include development::ruby
  include development::haskell
  include development::vagrant

  package { 'python2-pygments': }
  package { 'ctags': }
}
