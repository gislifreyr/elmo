class scrotum {

	$gpkgs =	[  ]

	$rhpkgs =	[	"xorg-x11-apps",
					"ImageMagick", ]

	$debpkgs =	[	"x11-apps",
					"imagemagick", ]

	package { $gpkgs: ensure	=> installed }

	case $operatingsystem {
		'RedHat', 'CentOS', 'Fedora': {                                         
			package { $rhpkgs: ensure   => installed }
		}   
		/^(Debian|Ubuntu)$/: {
			package { $debpkgs: ensure  => installed }
		}   
	}

	cron { 'scrotum.sh':
	
		command	=> '/home/gisli/devel/debora/files/scrotum.sh',
		minute	=> '*/12',
		hour	=> [ '9-16' ],
		weekday	=> [ '1-5' ],
		user	=> gisli,
	
	}

}
