class logcheck::logfiles ( $log_files = [ '/var/log/syslog', '/var/log/auth.log' ] )
{

  include logcheck::params

  file {
    '/etc/logcheck/logcheck.logfiles':
      content => template('logcheck/logcheck.logfiles'),
      mode    => '0640',
      owner   => root,
      group   => logcheck;
  }
}
