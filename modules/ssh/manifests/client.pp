class ssh::client {
  package {
    [
      'openssh',
      'sshfs',
      'sshpass',
      'mosh',
    ]:
  }

  package { 'envoy':
    provider => 'aur',
    name     => 'envoy-git',
  }

  service { 'envoy@gpg-agent.service':
    ensure  => running,
    enable  => true,
    require => Package['envoy'],
  }
}
