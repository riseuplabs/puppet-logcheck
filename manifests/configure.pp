class logcheck::configure (
  $email                   = $logcheck::params::email,
  $level                   = $logcheck::params::level,
  $config                  = '/etc/logcheck/logcheck.conf',
  $tmpdir                  = $logcheck::params::tmpdir,
  $intro                   = $logcheck::params::intro,
  $sortuniq                = $logcheck::params::sortuniq,
  $support_cracking_ignore = $logcheck::params::support_cracking_ignore
)
{

  include logcheck::params

  augeas { 'configure-logcheck' :
    incl    => $config,
    lens    => 'Shellvars.lns',
    changes => [ "set REPORTLEVEL ${level}",
	         "set SENDMAILTO ${email}",
                 "set INTRO ${intro}",
                 "set SORTUNIQ ${sortuniq}",
                 "set SUPPORT_CRACKING_IGNORE ${support_cracking_ignore}" ]
  }

  augeas { 'logcheck_TMPDIR':
    context => '/files/etc/cron.d/logcheck/rule',
    changes => [ 'ins TMPDIR after /files/etc/cron.d/logcheck/MAILTO',
                 "set /files/etc/cron.d/logcheck/TMPDIR ${tmpdir}" ],
    onlyif  => "get /files/etc/cron.d/logcheck/TMPDIR != ${tmpdir}"
  }

  augeas { 'logcheck_intro':
    incl    => $config
    lens    => 'Shellvars.lns',
    changes => "set INTRO ${intro}"
  }

  Class['logcheck::params'] ->
  Class['logcheck::install'] ->
  Class['logcheck::configure']

}

