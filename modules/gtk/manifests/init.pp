class gtk {
  include gtk::themes

  package { 'gtk2': }
  package { 'gtk3': }
  package { 'lxappearance': }
}
