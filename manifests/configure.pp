class logcheck::configure (
  $email = $logcheck::params::email,
  $level = $logcheck::params::level,
  $config = '/etc/logcheck/logcheck.conf',
)
{

  include logcheck::params

  augeas { 'configure-logcheck' :
    incl    => $config,
    lens    => 'Shellvars.lns',
    changes => [ "set REPORTLEVEL ${level}",
	         "set SENDMAILTO ${email}" ]
  }

  Class['logcheck::params'] ->
  Class['logcheck::install'] ->
  Class['logcheck::configure']

}

