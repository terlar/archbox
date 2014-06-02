class mail {
  package {
    [
      'mutt',
      'offlineimap',
      'msmtp',
      'notmuch',
      'notmuch-mutt',
      'w3m',
      'sqlite'
    ]:
  }
  aur::package { 'urlview': }

  package { 'ppl':
    provider => 'gem'
  }
}
