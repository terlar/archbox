class gtk {
  include gtk::themes

  package {
    [
      'gtk2',
      'gtk3',
      'lxappearance',
      'gtk-vnc',
    ]:
  }
}
