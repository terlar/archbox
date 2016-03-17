class development::java {
  package {
    [
      'eclipse-java',
      'jdk8-openjdk',
      'java-openjfx',
    ]:
  }

  package { 'jdk':
    provider => 'aur',
    name     => 'jdk',
  }

  package { 'javafx-scenebuilder':
    provider => 'aur',
    name     => 'javafx-scenebuilder-bin',
  }

  package { 'eclim':
    provider => 'aur',
    name     => 'eclim',
  }
}
