class logcheck::params {

  $packages = $::operatingsystem ? {
    ubuntu => ['logcheck'],
    debian => ['logcheck', 'logcheck-database', 'logtail'],
  }

  $email = 'logcheck'

  $level = 'server'

  # Sets the tmp directory to /var/tmp if we are on a vserver, since these
  # tend to create very small /tmp partitions by default
  $tmpdir = $::virtual ? {
    'vserver' => '/var/tmp',
    default   => '/tmp'
  }

  $intro = '1'

  $sortuniq = '0'

  $support_cracking_ignore = '0'
}
