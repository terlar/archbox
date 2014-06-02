class mutt {
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

  package { 'urlview': }
  package { 'ppl':
    provider => 'gem'
  }
}
