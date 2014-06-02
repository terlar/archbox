class idevice {
  package { 'libimobiledevice': }
  package { 'ifuse': }
  package { 'usbmuxd': }

  kmod::load { 'ipheth': ensure  => present }
}
