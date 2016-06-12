class vcs {
  package {
    [
      'git',
      'tig',
    ]:
  }

  package { 'hub':
    provider => 'aur',
    name     => 'hub-bin',
  }

  package { 'ghi':
    provider => 'aur',
  }
}
