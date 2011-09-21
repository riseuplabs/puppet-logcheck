
class logcheck::configuration (
	$root_user = 'root',
	$root_group = 'root',
	$logcheck_group = 'logcheck',
	$log_files=['/var/log/syslog', '/var/log/auth.log'],

	$report_level = "server",
	$message_header = false,
	$message_recipient="logcheck",
	$message_attachment = false
) {

	$message_header_real = $message_header
	$report_level_real = $report_level
	$message_recipient_real = $message_recipient
	$message_attachment_real = $message_attachment
	$support_cracking_ignore = false
	$rule_dir = '/etc/logcheck'

	# Crontab to schedule runs
	file { '/etc/cron.d/logcheck' :
		ensure => file,
		owner => $root_user,
		group => $root_group,
		mode => 0644,
	}

	# Configuration of logcheck
	file { '/etc/logcheck/logcheck.conf' :
		ensure => file,
		owner => $root_user,
		group => $logcheck_group,
		mode => 0640,
		content => template('logcheck/logcheck.conf'),
	}

	# Configure the files to be monitored
	file { '/etc/logcheck/logcheck.logfiles' :
		ensure => file,
		owner => $root_user,
		group => $logcheck_group,
		mode => 0640,
		content => template('logcheck/logcheck.logfiles'),
	}

	# Configure the email message header
	file { '/etc/logcheck/header.txt' :
		ensure => file,
		owner => $root_user,
		group => $logcheck_group,
		mode => 0644,
		content => template('logcheck/header.txt'),
	}


	Class['logcheck::install'] -> Class['logcheck::configuration']

}

