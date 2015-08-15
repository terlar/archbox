class gtk::themes {
  package {
    [
      'gnome-themes-standard',
      'numix-themes',
    ]:
  }

  aur::package { 'gtk-theme-numix-white': }
}
