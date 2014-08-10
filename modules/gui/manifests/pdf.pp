class gui::pdf {
  package { 'zathura': }
  package { 'zathura-pdf-poppler': }
  aur::package { 'zathura-epub-git': }
}
