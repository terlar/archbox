class console::spelling {
  package {
    [
      'aspell',
      'aspell-en',
      'aspell-sv',
      'rlwrap',
    ]:
  }

  package { 'translate-shell':
    provider => 'aur',
    name     => 'translate-shell-git',
  }
}
