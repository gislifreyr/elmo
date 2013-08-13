class utilities {
	include utilities::monitor-debug
	include utilities::other-tools
}

class utilities::monitor-debug {
	package { "chkrootkit": ensure => absent }
	package { "dstat": ensure => installed }
	package { "htop": ensure => installed }
	package { "iftop": ensure => installed }
	package { "mtr": ensure => installed }
	package { "multitail": ensure => installed }
	package { "net-tools": ensure => installed }
	package { "ngrep": ensure => installed }
	package { "nmap": ensure => installed }
	package { "procps": ensure => installed }
	package { "psmisc": ensure => installed }
	package { "rkhunter": ensure => absent }
	package { "strace": ensure => installed }
	package { "sysstat": ensure => installed }
	package { "tcpdump": ensure => installed }
	case $operatingsystem {
		'RedHat', 'CentOS', 'Fedora': { package { "bind-utils": ensure => installed } }
		/^(Debian|Ubuntu)$/: { package { "dnsutils": ensure => installed } }
	}
}

class utilities::other-tools {
	package { "ccze": ensure => installed }
	package { "curl": ensure => installed }
	package { "elinks": ensure => installed }
	package { "screen": ensure => installed }
	package { "telnet": ensure => installed }
	package { "tmux": ensure => installed }
	package { "vim-common": ensure => installed }
}
