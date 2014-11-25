class ssh::client {
  package {
    [
      'openssh',
      'sshfs',
      'mosh'
    ]:
  }

  aur::package { 'envoy-git': } ->
  service { 'envoy@gpg-agent.service':
    ensure => running,
    enable => true
  }
}
