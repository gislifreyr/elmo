class media {
	include media::audio
	include media::video
}

class media::audio {
	package { "cmus": ensure => installed }
}

class media::video {
	
}
