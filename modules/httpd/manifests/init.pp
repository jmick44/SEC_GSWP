class httpd (
  $message = 'Puppet is awesome!',
  $package = $httpd::params::package,
  $docroot = $httpd::params::docroot,
  $service = $httpd::params::service,
) inherits httpd::params {
  
  File {
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }

  #notify { "$message": }

  package { $package:
    ensure => present,
  }

  file { $docroot:
    ensure  => directory,
    mode    => '0777',
    require => Package[$package],
  }

  file { "${docroot}/index.html":
    ensure  => file,
    #content => $message,
    #source  => 'puppet:///modules/httpd/index.html',
    content  => template('httpd/index.html.erb'),
    require => File[$docroot],
    notify  => Service[$service],
  }

  service { $service:
    ensure => running,
  }
}

#class { 'httpd':
#  message => 'My awesome updated message!!!!!',
#}

include httpd






