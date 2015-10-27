class gui::games {
  package {
    [
      'xonotic',
      'wine',
      'sdlmame',
      'fceux',
      'snes9x-gtk',
      'scummvm',
      'ppsspp',
    ]:
  }

  package {
    [
      'dolphin-emu',
      'steam',
    ]: provider => 'aur',
  }
}
