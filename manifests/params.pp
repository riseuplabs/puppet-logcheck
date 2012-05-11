
class logcheck::params {

	$packages = $operatingsystem ? {
		ubuntu => ['logcheck'],
	}

	$email = "logcheck"

	$level = "server"

}
