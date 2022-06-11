  exec { 'apt-update':
	command => '/usr/bin/apt update'
  }

  packege { ['php7.4', 'php7.4-mysql']:
    require => Exec['apt-update'],
    ensure => installed,
  }
  exec { 'run-php7':
    require => Packege['php7.4'],
    command => '/usr/bin/php -S 0.0.0.0:8888 -t /vagrant/src &'
  }
