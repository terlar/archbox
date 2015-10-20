class gtk::themes {
  package {
    [
      'gnome-themes-standard',
    ]:
  }

  aur::package {
    [
      'gtk-theme-arc',
      'paper-gtk-theme-git',
      'paper-icon-theme-git',
    ]:
  }
}
