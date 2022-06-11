exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}

package { ['php5', 'php5-mssql']:
  require => Exec['apt-update'],
  ensure => installed,
}

exec { 'run-php5':
  require => Package['php5'],
  command => '/usr/bin/php -S 0.0.0.0:8888 -t /vagrant/src &'
}
