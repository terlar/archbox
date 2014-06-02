class services::elasticsearch {
  package { 'elasticsearch': }

  exec { 'elasticsearch-plugin paramedic':
    command => 'elasticsearch-plugin -i karmi/elasticsearch-paramedic',
    unless  => 'elasticsearch-plugin -l | grep paramedic',
    require => Package['elasticsearch']
  }

  exec { 'elasticsearch-plugin kopf':
    command => 'elasticsearch-plugin -i lmenezes/elasticsearch-kopf',
    unless  => 'elasticsearch-plugin -l | grep kopf',
    require => Package['elasticsearch']
  }

  exec { 'elasticsearch-plugin HQ':
    command => 'elasticsearch-plugin -i royrusso/elasticsearch-HQ',
    unless  => 'elasticsearch-plugin -l | grep HQ',
    require => Package['elasticsearch']
  }
}
