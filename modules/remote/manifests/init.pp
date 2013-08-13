class remote {
	include remote::remmina
}

class remote::remmina {
	package { 'remmina': ensure => installed }
	package { 'remmina-plugin-rdp': ensure => installed }
}
