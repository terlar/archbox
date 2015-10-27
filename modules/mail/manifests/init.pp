class mail {
  package {
    [
      'mutt',
      'offlineimap',
      'msmtp',
      'notmuch',
      'notmuch-mutt',
      'w3m',
      'sqlite',
    ]:
  }
  package { 'urlview':
    provider => 'aur',
  }

  package { 'ppl':
    provider => 'gem',
  }
}
