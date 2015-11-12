class ssh::client {
  package {
    [
      'openssh',
      'sshfs',
      'sshpass',
      'mosh',
    ]:
  }
}
