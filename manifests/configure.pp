class logcheck::configure (
  $email = $logcheck::params::email,
  $level = $logcheck::params::level,
  $config = '/etc/logcheck/logcheck.conf',
  $tmpdir = $logcheck::params::tmpdir
)
{

  include logcheck::params

  augeas { 'configure-logcheck' :
    incl    => $config,
    lens    => 'Shellvars.lns',
    changes => [ "set REPORTLEVEL ${level}",
	         "set SENDMAILTO ${email}" ]
  }

  augeas { 'set_TMPDIR':
    context => '/files/etc/cron.d/logcheck/rule',
    changes => [ 'ins TMPDIR after /files/etc/cron.d/logcheck/MAILTO',
                 "set /files/etc/cron.d/logcheck/TMPDIR ${tmpdir}" ],
    onlyif  => "get /files/etc/cron.d/logcheck/TMPDIR != ${tmpdir}"
  }

  Class['logcheck::params'] ->
  Class['logcheck::install'] ->
  Class['logcheck::configure']

}

