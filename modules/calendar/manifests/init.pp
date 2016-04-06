class calendar {
  package { 'khal':
    provider => 'aur',
  }

  package { 'vdirsyncer':
    provider => 'aur',
    name     => 'python-vdirsyncer-git',
  }
}
