class logcheck::install ( $version = 'installed' )
{

  include logcheck::params
 
  $packages = $logcheck::params::packages

  package { $packages :
    ensure => $version
  }

  '/var/lock/logcheck':
    ensure  => directory,
    mode    => '0755',
    owner   => logcheck,
    group   => logcheck,
    require => [ Package['logcheck'], Package['logcheck-database'] ];

}
