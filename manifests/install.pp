class logcheck::install 
{

  include logcheck::params

  package { $packages :
    ensure => installed
  }

  '/var/lock/logcheck':
    ensure  => directory,
    mode    => '0755',
    owner   => logcheck,
    group   => logcheck,
    require => [ Package['logcheck'] ];

}
