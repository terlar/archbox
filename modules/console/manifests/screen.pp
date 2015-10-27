class console::screen {
  package { 'tmux': }

  package { 'tmate':
    provider => 'aur',
  }
  package { 'wemux':
    provider => 'aur',
    name     => 'wemux-git',
  }
}
