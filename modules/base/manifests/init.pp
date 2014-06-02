class base {
  include base::sudo
  include base::archiving

  package {
    [
      'ca-certificates',
      'which',
      'time',
      'tree',
      'curl',
      'bc',
      'pv'
    ]:
  }
}
