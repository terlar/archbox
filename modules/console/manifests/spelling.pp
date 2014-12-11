class console::spelling {
  package { 'aspell': }
  package { 'rlwrap': }
  aur::package { 'aspell-sv': }
  aur::package { 'translate-shell-git': }
}
