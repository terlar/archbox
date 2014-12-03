class gui::browser {
  package { 'firefox': }
  package { 'flashplugin': }
  aur::package { 'google-talkplugin': }
  aur::package { 'pentadactyl-hg': }
}
