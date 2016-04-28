class base {
  include base::sudo
  include base::ntp
  include base::archiving
  include base::filesystems

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

  package { 'fpp':
    provider => 'aur',
    name     => 'fpp-git',
  }

  file { '/etc/systemd/journald.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/base/systemd/journald.conf'
  }

  file { '/etc/systemd/system/systemd-fsck@.service.d':
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/base/systemd/system/systemd-fsck@.service.d',
    recurse => true
  }
}
