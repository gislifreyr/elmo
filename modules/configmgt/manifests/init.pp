class configmgt {
	# Need this for puppet modificiations of file contents
	package { "augeas-tools": ensure => installed }
}
