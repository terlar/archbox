class console::spelling {
  package {
    [
      'aspell',
      'aspell-en',
      'aspell-sv',
      'rlwrap'
    ]:
  }

  aur::package { 'translate-shell-git': }
}
