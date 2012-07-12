
class logcheck::params {

	$packages = $operatingsystem ? {
		ubuntu => ['logcheck'],
		debian => ['logcheck'],
	}

	$email = "logcheck"

	$level = "server"

}
