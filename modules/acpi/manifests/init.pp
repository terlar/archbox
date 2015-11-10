class acpi {
  package {
    [
      'acpi',
      'acpid',
    ]:
  }

  service { 'acpid':
    ensure => 'running',
    enable => true,
  }

  Package[acpi] -> Package[acpid] -> Service[acpid]

  Package[acpi]  ~> Service[acpid]
  Package[acpid] ~> Service[acpid]

  file { '/etc/acpi/events':
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/acpi/events',
    recurse => true,
    require => Package[acpi],
  }

  file { '/etc/acpi/handlers':
    ensure => directory,
    owner  => 'root',
    group  => 'root'
  }

  file { '/etc/acpi/handlers/backlight':
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/acpi/handlers/backlight',
    require => [
      Package[acpi],
      File['/etc/acpi/handlers'],
    ],
  }

  file { '/etc/acpi/handlers/cd':
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/acpi/handlers/cd',
    require => [
      Package[acpi],
      File['/etc/acpi/handlers'],
    ],
  }

  file { '/etc/acpi/handlers/volume':
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/acpi/handlers/volume',
    require => [
      Package[acpi],
      File['/etc/acpi/handlers'],
    ],
  }
}
