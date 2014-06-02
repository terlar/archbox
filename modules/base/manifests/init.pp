class base {
  include base::sudo
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

  file { '/etc/issue':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/base/issue.bright'
  }

  file { '/etc/systemd/journald.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/base/systemd/journald.conf'
  }

  file { '/etc/systemd/system/getty@tty1.service.d':
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/base/systemd/system/getty@tty1.service.d',
    recurse => true
  }

  file { '/etc/systemd/system/systemd-fsck@.service.d':
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/base/systemd/system/systemd-fsck@.service.d',
    recurse => true
  }
}
