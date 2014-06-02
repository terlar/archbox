class acpi {
  package { 'acpi': }
  package { 'acpid': }

  service { 'acpid':
    ensure    => running,
    enable    => true
  }

  Package[acpi] -> Package[acpid] -> Service[acpid]

  Package[acpi]  ~> Service[acpid]
  Package[acpid] ~> Service[acpid]
}
