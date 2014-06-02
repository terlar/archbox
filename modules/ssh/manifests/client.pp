class ssh::client {
  package {
    [
      'openssh',
      'sshfs',
      'mosh'
    ]:
  }

  aur::package { 'envoy-git': } ->
  service { 'envoy@ssh-agent.socket':
    ensure => running,
    enable => true
  }

  aur::package { 'monkeysphere': }
}
