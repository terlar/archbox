class bluetooth {
  package {
    [
      'bluez',
      'bluez-utils'
    ]:
  }

  service { 'bluetooth':
    ensure    => stopped,
    enable    => false,
    hasstatus => false
  }

  Package[bluez-utils] -> Package[bluez] -> Service[bluetooth]

  Package[bluez-utils] ~> Service[bluetooth]
  Package[bluez]       ~> Service[bluetooth]
}
