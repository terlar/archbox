class networking::wifi($interface='wlp3s0b1') {
  package { 'wpa_supplicant': }

  file { '/etc/wpa_supplicant.conf':
    ensure  => present,
    replace => 'no',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/networking/wpa_supplicant.conf'
  }

  file { '/etc/wpa_supplicant':
    ensure => directory,
    owner  => 'root',
    group  => 'root'
  }

  file { "/etc/wpa_supplicant/wpa_supplicant-${interface}.conf":
    ensure  => link,
    owner   => 'root',
    group   => 'root',
    target  => '/etc/wpa_supplicant.conf',
    require => [
      File['/etc/wpa_supplicant'],
      File['/etc/wpa_supplicant.conf']
    ]
  }

  service { "wpa_supplicant@${interface}":
    ensure    => running,
    enable    => true,
    hasstatus => false,
    require   => [
      File["/etc/wpa_supplicant/wpa_supplicant-${interface}.conf"]
    ]
  }
}
