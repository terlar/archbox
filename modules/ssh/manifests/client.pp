class ssh::client {
  package {
    [
      'openssh',
      'sshfs',
      'mosh',
      'sshpass'
    ]:
  }

  aur::package { 'envoy-git': } ->
  service { 'envoy@gpg-agent.service':
    ensure => running,
    enable => true
  }
}
