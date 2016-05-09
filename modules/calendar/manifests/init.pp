class calendar {
  package { 'khal':
    provider => 'aur',
  }

  package { 'vdirsyncer':
    provider => 'aur',
    name     => 'vdirsyncer-git',
  }
}
