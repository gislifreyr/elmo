class programming {
	include programming::c
	include programming::python
	include programming::ruby
	include programming::version-control
}

class programming::c {
	package { "gcc": ensure => installed }
	package { "valgrind": ensure => installed }
}

class programming::python {
	package { "python-pip": ensure => installed }
}

class programming::ruby {
	package { "ruby": ensure => installed }
	package { "rubygems": ensure => installed }
	package { "bundler": ensure => installed, provider => gem }
}

class programming::version-control {
	package { "git": ensure => installed }
}
