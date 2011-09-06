
class logcheck {

	include logcheck::package
	include logcheck::configuration

	Class['logcheck::package'] -> Class['logcheck::configuration']

}
