class httpd::params {
  if $::kernel == 'Linux' {
    $package = 'httpd'
    $docroot = '/var/www/html'
    $service = 'httpd'
  }
  elsif $::kernel == 'windows' {
    $package = 'apache'
    $docroot = "C:\\ProgramData\\apache\\html"
    $service = 'apache'
  }
  else {
    fail("OS not supported - ${::kernel}")
  } 
}
