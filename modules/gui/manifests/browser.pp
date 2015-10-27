class gui::browser {
  package {
    [
      'firefox',
      'flashplugin',
    ]:
  }

  package { 'google-talkplugin':
    provider => 'aur',
  }
  package { 'pentadactyl':
    provider => 'aur',
    name     => 'pentadactyl-git',
  }
}
