class logcheck::install ( $version = 'installed' )
{

  include logcheck::params

  $packages = $logcheck::params::packages

  package { $packages :
    ensure => $version
  }

  # ensure certain modes/ownership
  file {
    '/var/lock/logcheck':
      ensure  => directory,
      mode    => '0755',
      owner   => logcheck,
      group   => logcheck,
      require => [ Package['logcheck'], Package['logcheck-database'] ];

    '/etc/logcheck/logcheck.conf':
      mode    => '0640',
      owner   => root,
      group   => logcheck;
  }

}
