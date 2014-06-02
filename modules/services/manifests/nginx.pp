class services::nginx {
  package { 'nginx': }

  file { '/etc/nginx/nginx.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/services/nginx/nginx.conf',
    require => Package['nginx']
  }

  file { '/etc/nginx/sites-available':
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/services/nginx/sites-available',
    recurse => true
  }

  file { '/etc/nginx/sites-enabled':
    ensure => directory,
    owner  => 'root',
    group  => 'root'
  }

  file { '/etc/nginx/sites-enabled/dev':
    ensure  => link,
    owner   => 'root',
    group   => 'root',
    target  => '/etc/nginx/sites-available/dev',
    require => [
      File['/etc/nginx/sites-enabled'],
      File['/etc/nginx/sites-available']
    ]
  }

  file { '/etc/nginx/sites-enabled/ngrok.com':
    ensure  => link,
    owner   => 'root',
    group   => 'root',
    target  => '/etc/nginx/sites-available/ngrok.com',
    require => [
      File['/etc/nginx/sites-enabled'],
      File['/etc/nginx/sites-available']
    ]
  }
}
