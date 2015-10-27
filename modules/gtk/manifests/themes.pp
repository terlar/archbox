class gtk::themes {
  package {
    [
      'gnome-themes-standard',
    ]:
  }

  package { 'gtk-theme-arc':
    provider => 'aur',
  }
  package { 'paper-gtk-theme':
    provider => 'aur',
    name     => 'paper-gtk-theme-git',
  }
  package { 'paper-icon-theme':
    provider => 'aur',
    name     => 'paper-icon-theme-git',
  }
}
