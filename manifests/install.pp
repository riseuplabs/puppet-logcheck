
class logcheck::install {

	package { logcheck :
		ensure => installed
	}

	Class['logcheck::install'] -> Class['logcheck::configuration']
}
