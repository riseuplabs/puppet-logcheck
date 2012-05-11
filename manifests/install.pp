
class logcheck::install inherits logcheck::params {

	$packages = $logcheck::params::packages

	package { $packages :
		ensure => installed
	}

}
