
class chitterchatter {
	include chitterchatter::desktop-only
	include chitterchatter::server-desktop
}

class chitterchatter::desktop-only {
	package { "thunderbird": ensure => installed }
	#package { ["pidgin-sipe", "pidgin"]: ensure => installed }
}

class chitterchatter::server-desktop {
	package { "irssi": ensure => installed }
}
